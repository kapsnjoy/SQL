Term query
with tmp_pl as
(select *
  from ( SELECT distinct b.id_medicaid, P.DTE_EFFECTIVE, P.DTE_END , P.AMT_PATNT_LIAB
        ,max(P.DTE_END) over(partition by b.id_medicaid) as max_dte_end
        ,b.sak_recip
        
        FROM T_RE_PAT_LIAB P 
        JOIN  T_RE_BASE B 
        ON B.SAK_RECIP = p.SAK_RECIP
        join dcv6206.TEDS_PL_GAPS_TERMS t
        on t.id_medicaid = b.id_medicaid
              )  
 where dte_end = Max_dte_end 
)

select distinct z.id_medicaid, substr(z.DTE_EFFECTIVE,1,8) as dte_effect, substr(z.DTE_END,1,8) as dte_end , 
substr(z.AMT_PATNT_LIAB,1,7) as amt
,decode (x.cde_aid_category ,40, 'XIX ', 'SSI') 
 ||
x.cde_aid_category || ' ' || x.cde_state_cat || ' ' || x.dte_effective || ' - ' || x.dte_end as MMIS_ELIGIBILITY
from tmp_pl z
join  (select distinct  a.sak_recip, d.cde_state_cat, c.cde_aid_category, d.num_case, a.dte_effective, a.dte_end, e.sak_pub_hlth
              from T_RE_AID_ELIG a
              JOIN T_CDE_AID c
                ON a.sak_cde_aid = c.sak_cde_aid 
              JOIN T_RE_CASE d
                ON A.SAK_CASE = D.SAK_CASE 
              join t_Re_elig e 
                on e.sak_recip = a.sak_recip
               and e.sak_pgm_elig = a.sak_pgm_elig
             where a.cde_status1 = ' '
               and e.cde_status1 = ' '
               and e.sak_pub_hlth = 1002
               and substr(d.num_case,1,2) = 'TD'
               and ((c.cde_aid_category = '40'
               and d.cde_state_cat = 'MA D')
               or (c.cde_aid_category = '41'
               and d.cde_state_cat = 'TEDS'))
            ) x
    on z.sak_recip = x.sak_recip
  -- and z.num_case = x.num_case
   and z.max_dte_end < x.dte_end
  
where sak_pub_hlth = 1002 
and (cde_aid_category = '40'
and cde_state_cat = 'MA D')
or (cde_aid_category = '41'
and cde_state_cat = 'TEDS'
and x.sak_recip in (select loc.sak_recip from t_re_loc loc
                     where loc.dte_end > z.max_dte_end
                      and loc.CDE_PAT_STATUS = '30'));
------Gap
              
WITH TMP_ELIG AS
(
SELECT ID_MEDICAID
,dte_effective 
,DTE_END
,AMT_PATNT_LIAB
,dte_last_update
FROM T_RE_PAT_LIAB l
JOIN T_RE_BASE B
ON B.Sak_recip = L.SAK_RECIP
WHERE B.ID_MEDICAID IN (SELECT ID_MEDICAID FROM dcv6206.TEDS_PL_GAPS_TERMS
                         )

order by 2
),
---- sum consective date  
sum_dates as (        
select ID_MEDICAID
,MIN(DTE_EFFECTIVE) AS DTE_EFFECTIVE
,MAX(DTE_END) as dte_end

FROM (SELECT DISTINCT ID_MEDICAID
,DTE_EFFECTIVE
,DTE_END

,SUM(GRP_START) OVER(ORDER BY ID_MEDICAID, DTE_EFFECTIVE, DTE_END) GRP
  FROM (SELECT  distinct ID_MEDICAID,DTE_EFFECTIVE, DTE_END
        ,CASE
           WHEN TO_DATE(DTE_EFFECTIVE,'yyyymmdd') <= LAG(TO_DATE(DTE_END,'yyyymmdd')) 
                   OVER (PARTITION BY ID_MEDICAID  ORDER BY DTE_EFFECTIVE, DTE_END) + 1
           THEN 0 ELSE 1
           END GRP_START
         FROM TMP_ELIG)H
     )
GROUP BY ID_MEDICAID,GRP
ORDER BY  ID_MEDICAID, GRP
),

list_report as (
SELECT SD.*
,ROW_NUMBER() OVER (PARTITION BY ID_MEDICAID ORDER BY ID_MEDICAID, dte_effective desc) AS elim_row
FROM SUM_DATES SD),

list_date_comp as (

SELECT * FROM LIST_REPORT L1
WHERE 2 IN (SELECT elim_row FROM LIST_REPORT l2
              WHERE L2.ID_MEDICAID = L1.ID_MEDICAID)
and exists (select 1 from list_report l3
              where l3.id_medicaid = l1.id_medicaid
              and elim_row = (select min(elim_row) + 1 from list_report l4
                              where l3.id_medicaid = l4.id_medicaid)
              and dte_end > to_number(to_char(add_months(sysdate, -12),'yyyymmdd'))
              )
  and elim_row in (1,2)
order by 1, 2 desc)

select distinct current_date as dte_report, d.num_case, ldc1.ID_MEDICAID
,'MMIS GAP (Missing ' ||
to_char(to_date(ldc2.dte_end,'yyyymmdd') + 1 ) || '-' ||
to_char(to_date(ldc1.dte_effective,'yyyymmdd') - 1) || ')'  ||  
 decode (c.cde_aid_category ,40, 'XIX ', 'SSI')  
 || c.cde_aid_category || ' ' || d.cde_state_cat || ' '
|| to_char(a.dte_effective) || ' ' || to_char(a.dte_end) as note

from ((select * from list_date_comp  
         where elim_row = 1) ldc1
join (select * from list_date_comp  
        where elim_row = 2) ldc2
   on ldc1.id_medicaid = ldc2.id_medicaid)   
   
join  t_re_base b   
  on  b.id_medicaid = ldc1.id_medicaid
JOIN T_RE_AID_ELIG a
  ON a.sak_recip = b.sak_recip
JOIN T_CDE_AID c
  ON a.sak_cde_aid = c.sak_cde_aid 
JOIN T_RE_CASE d
  ON A.SAK_CASE = D.SAK_CASE 
join t_Re_elig e 
  on e.sak_recip = a.sak_recip
and e.sak_pgm_elig = a.sak_pgm_elig
  where sak_pub_hlth = 1002
    and a.cde_status1 = ' '
  
    and to_number(to_char(to_date(ldc2.dte_end,'YYYYMMDD')+ 1,'yyyymmdd')) <= a.dte_end
    and to_number(to_char(to_date(ldc1.dte_effective,'yyyymmdd') - 1,'yyyymmdd')) >= a.dte_effective
    and ((c.cde_aid_category = '40'
    and d.cde_state_cat = 'MA D')
     or (c.cde_aid_category = '41'
    and b.sak_recip in (select sak_recip from t_re_loc loc
                       where to_number(to_char(to_date(ldc2.dte_end,'yyyymmdd') + 1,'yyyymmdd')) <= loc.dte_end
                       and to_number(to_char(to_date(ldc1.dte_effective,'yyyymmdd') - 1,'yyyymmdd')) >= loc.dte_effective
                       and loc.CDE_PAT_STATUS = '30'
                       )
          ))
