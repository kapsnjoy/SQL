-- spinning for long time;
with pl_ordered_ranges AS (
    SELECT
		 m.sak_recip as sak_recip,
         recon.id_medicaid as id_medicaid,
	     recon.SAK_TRAN_RELIG,
         PAT_DTE_EFFECTIVE_5,
		 PAT_DTE_END_5,
         decode(recon.PAT_DTE_END_5,'00000000',22991231,'        ',22991231,recon.PAT_DTE_END_5),
	 	 AMT_PATNT_LIAB_5,
         TO_date(pat.dte_effective,'YYYYMMDD') as Dte_effective,
         TO_date(pat.dte_end,'YYYYMMDD') as Dte_end,
         LAG(to_date(pat.dte_end,'YYYYMMDD')) OVER (ORDER BY pat.dte_effective) AS prev_end_date
    FROM  T_RE_PAT_LIAB pat
		  , t_re_teds_tranhist_relig recon
		  , t_Re_base m
   where  
          recon.dte_Added = 20241018
      and m.ind_Active = 'Y'
      and m.dte_death = 0
      and m.id_medicaid = 'TD500005013'
	  and trim(recon.id_medicaid) = trim(m.id_medicaid)
      and recon.num_case like 'TD%' 
      and (REGEXP_LIKE(E_DTE_END, '^[[:digit:]]+$'))
      and (REGEXP_LIKE(E_DTE_EFFECTIVE, '^[[:digit:]]+$'))
      and ( (to_number(E_DTE_EFFECTIVE) <= to_number(E_DTE_END) and E_DTE_END <> '00000000') or  E_DTE_END = '00000000')
  --  and txn_status = 'Y'  -- may be 'Y' after pre-edits are set
      and REGEXP_LIKE(PAT_DTE_EFFECTIVE_5, '^[[:digit:]]+$')
      and REGEXP_LIKE(PAT_DTE_END_5, '^[[:digit:]]+$')
	  and  PAT_DTE_EFFECTIVE_5 <> '00000000' 
	  and  PAT_DTE_END_5 <> '        ' 
      and  AMT_PATNT_LIAB_5 <> '         '
      and REGEXP_LIKE(AMT_PATNT_LIAB_5, '^[[:digit:]]+$')
        and  ( to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 5, 2)) between 1 and 12 )
        and ( to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 7, 2)) between 1 and 31  )
        and ( to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 1, 4))  BETWEEN 1900 AND 2026 ) -- include the upcoming year towards end of the year
        and(  ( to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 5, 2)) IN (09,04,06,11) AND to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 7, 2)) between 1 and 30)
         or (to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 5, 2)) IN (08,05,01,12,03,07,10) AND to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 7, 2)) between 1 and 31)
         or (to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 5, 2)) IN (02) AND to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 7, 2))between 1 and 28)
           )
        and   to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5) , 5, 2)) between 1 and 12 
        and  to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5), 7, 2)) between 1 and 31 
        and ( to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5), 1, 4)) BETWEEN 1900 AND 2026
          or to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5), 1, 4)) = 2299  ) -- include the upcoming year towards end of the year
        and ( ( to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5), 5, 2)) IN (09,04,06,11) 
                   AND to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5),7, 2)) between 1 and 30)
        or ( to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5), 5, 2)) IN (08,05,01,12,03,07,10) 
                   AND to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5), 7, 2)) between 1 and 31)
        or ( to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5), 5, 2)) IN (02)
                  AND to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5), 7, 2)) between 1 and 28)   
            )
	    and m.sak_Recip = pat.sak_recip 
 )
 SELECT
	sak_Recip,
    SAK_TRAN_RELIG,
	id_medicaid,
    PAT_DTE_EFFECTIVE_5,
    PAT_DTE_END_5,
	Dte_effective as mmis_pat_dte_effective,
    Dte_end as mmis_pat_dte_end,
    to_char(prev_end_date + 1,'YYYYMMDD') AS gap_start,
    to_char(dte_effective - 1,'YYYYMMDD') AS gap_end
	,'L0080'
FROM    pl_ordered_ranges
  WHERE  prev_end_date IS NOT NULL
    AND dte_effective > prev_end_date + 1
    and ( to_number(to_char(prev_end_date + 1,'YYYYMMDD')) between to_number(PAT_DTE_EFFECTIVE_5) and 
                                 to_number(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5))
	   or to_number(to_char(dte_effective - 1,'YYYYMMDD')) between to_number(PAT_DTE_EFFECTIVE_5) and
                              to_number(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5))
   	)
 ;
 
 -- modified version part#2 with exists & temp list 
 -- drop table I24_L0098_D022425
 create table I23_L0098_D102524 as 
  SELECT  
         recon.id_medicaid as id_medicaid
		, recon.SAK_TRAN_RELIG
		, m.sak_recip as sak_recip
		,recon.E_DTE_EFFECTIVE -- need to find the actual corresponding span in MMIS
		,recon.E_DTE_END 
		,recon.MMIS_CDE_AID 
		,recon.MMIS_CDE_STATE_CAT 
		,recon.NUM_CASE
        ,PAT_DTE_EFFECTIVE_5
		, PAT_DTE_END_5
        , AMT_PATNT_LIAB_5
        ,'L0098-2' as pedit
    FROM   t_re_teds_tranhist_relig recon
         , t_Re_base m
         , T_RE_TEDS_TRAN_PL_RELIG pl
   where  
          recon.dte_Added = 20241025
      and pl.dte_cycle = 20241025    
      and m.ind_Active = 'Y'
      and m.dte_death = 0
 --     and m.id_medicaid = 'TD500005013'
	  and trim(recon.id_medicaid) = trim(m.id_medicaid)
      and trim(pl.id_medicaid) = trim(recon.id_medicaid)
      and recon.num_case like 'TD%' 
   --   and (REGEXP_LIKE(E_DTE_END, '^[[:digit:]]+$'))
    --  and (REGEXP_LIKE(E_DTE_EFFECTIVE, '^[[:digit:]]+$'))
      and ( (to_number(E_DTE_EFFECTIVE) <= to_number(E_DTE_END) and E_DTE_END <> '00000000') or  E_DTE_END = '00000000')
  --  and txn_status = 'Y'  -- may be 'Y' after pre-edits are set
      and REGEXP_LIKE(PAT_DTE_EFFECTIVE_5, '^[[:digit:]]+$')
      and REGEXP_LIKE(PAT_DTE_END_5, '^[[:digit:]]+$')
	  and  PAT_DTE_EFFECTIVE_5 <> '00000000' 
--	  and  PAT_DTE_END_5 <> '        ' 
 --     and  AMT_PATNT_LIAB_5 <> '         '
      and REGEXP_LIKE(AMT_PATNT_LIAB_5, '^[[:digit:]]+$')
--        and  ( to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 5, 2)) between 1 and 12 )
--        and ( to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 7, 2)) between 1 and 31  )
--        and ( to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 1, 4))  BETWEEN 1900 AND 2026 ) -- include the upcoming year towards end of the year
--        and(  ( to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 5, 2)) IN (09,04,06,11) AND to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 7, 2)) between 1 and 30)
--         or (to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 5, 2)) IN (08,05,01,12,03,07,10) AND to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 7, 2)) between 1 and 31)
--         or (to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 5, 2)) IN (02) AND to_number(SUBSTR(PAT_DTE_EFFECTIVE_5, 7, 2))between 1 and 29)
--           )
--        and   to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5) , 5, 2)) between 1 and 12 
--        and  to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5), 7, 2)) between 1 and 31 
--        and ( to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5), 1, 4)) BETWEEN 1900 AND 2026
--          or to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5), 1, 4)) = 2299  ) -- include the upcoming year towards end of the year
--        and ( ( to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5), 5, 2)) IN (09,04,06,11) 
--                   AND to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5),7, 2)) between 1 and 30)
--        or ( to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5), 5, 2)) IN (08,05,01,12,03,07,10) 
--                   AND to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5), 7, 2)) between 1 and 31)
--        or ( to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5), 5, 2)) IN (02)
--                  AND to_number(SUBSTR(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5), 7, 2)) between 1 and 29)   
--            )
and exists
    (  
    select 
        m.sak_Recip,
        m.id_medicaid,
        PAT_DTE_EFFECTIVE_5,
        PAT_DTE_END_5,
        Dte_effective as mmis_pat_dte_effective,
        Dte_end as mmis_pat_dte_end,
        to_char(prev_end_date + 1,'YYYYMMDD') AS gap_start,
        to_char(dte_effective - 1,'YYYYMMDD') AS gap_end
       
FROM  (   
        select
             pat.sak_recip
            , TO_date(pat.dte_effective,'YYYYMMDD') as Dte_effective
            , TO_date(pat.dte_end,'YYYYMMDD') as Dte_end
            , LAG(to_date(pat.dte_end,'YYYYMMDD')) OVER (ORDER BY pat.dte_effective) AS prev_end_date
     from T_RE_PAT_LIAB pat
        where  m.sak_Recip = pat.sak_recip
        ) pl
   where  prev_end_date IS NOT NULL -- this may need cahnges
      AND dte_effective > prev_end_date + 1
      and ( to_number(to_char(prev_end_date + 1,'YYYYMMDD')) between to_number(PAT_DTE_EFFECTIVE_5) and 
                                 to_number(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5))
	   or to_number(to_char(dte_effective - 1,'YYYYMMDD')) between to_number(PAT_DTE_EFFECTIVE_5) and
                              to_number(decode(PAT_DTE_END_5,'00000000',22991231,'        ',22991231,PAT_DTE_END_5))
    	)   
    ) -- Exists closing
--and not exists ( select 1 from T_RE_TEDS_TRANHIST_RELIG perr
--            where trim(perr.id_medicaid) = trim(recon.id_medicaid)
--                    and perr.dte_added = 20241025
--                    and recon.SAK_TRAN_RELIG = perr.sak_tran_relig    
--                    and   ( cde_Error1 = 'L0088'
--                    or cde_Error2 = 'L0088'
--                    or cde_Error3 = 'L0088'
--                    or cde_Error4 = 'L0088'
--                    or cde_Error5 = 'L0088'
--                    or cde_Error6 = 'L0088'
--                    or cde_Error7 = 'L0088'
--                    or cde_Error8 = 'L0088'
--                    or cde_Error9 = 'L0088'
--                    or cde_Error10 = 'L0088'
--                    )                                    
--                     )    
 	
 union
 -- part#1
 -- PL-eff-dt is not present in MMIS but  PL-end-id present and amount matches
select 
    recon.id_medicaid
    ,recon.SAK_TRAN_RELIG
    ,m.sak_Recip
    ,recon.E_DTE_EFFECTIVE -- need to find the actual corresponding span in MMIS
    ,recon.E_DTE_END 
    ,recon.MMIS_CDE_AID 
    ,recon.MMIS_CDE_STATE_CAT 
    ,recon.NUM_CASE
    ,PAT_DTE_EFFECTIVE_5
    ,PAT_DTE_END_5
    ,AMT_PATNT_LIAB_5
    ,'L0098-1' as pedit
  from T_RE_TEDS_TRANHIST_RELIG recon
    ,   t_Re_base m
    ,   T_RE_TEDS_TRAN_PL_RELIG pl 
where trim(recon.id_medicaid) = trim(m.id_medicaid)
      and trim(pl.id_medicaid) = trim(recon.id_medicaid)
     -- and recon.id_medicaid = 'TD718703233'
       and m.ind_Active = 'Y'
       and m.dte_death = 0
       and recon.dte_added = 20241025 -- cycle-dt
         and pl.dte_cycle = 20241025
      --  and txn_status = 'C'  -- may be 'Y' after pre-edits are set
        and (REGEXP_LIKE(PAT_DTE_EFFECTIVE_5, '^[[:digit:]]+$'))
        and (REGEXP_LIKE(PAT_DTE_END_5, '^[[:digit:]]+$'))
        and PAT_DTE_EFFECTIVE_5 <> '00000000'
    --    and ( AMT_PATNT_LIAB_5 <> '         ')
        and ( REGEXP_LIKE(AMT_PATNT_LIAB_5, '^[[:digit:]]+$'))
--        and  ( to_number(SUBSTR(recon.PAT_DTE_EFFECTIVE_5, 5, 2)) between 01 and 12 )
--        and ( to_number(SUBSTR(recon.PAT_DTE_EFFECTIVE_5, 7, 2)) between 01 and 31  )
--        and ( to_number(SUBSTR(recon.PAT_DTE_EFFECTIVE_5, 1, 4))  BETWEEN 1900 AND 2030 ) -- include the upcoming year towards end of the year
--        and(  ( to_number(SUBSTR(recon.PAT_DTE_EFFECTIVE_5, 5, 2)) IN (09,04,06,11) AND to_number(SUBSTR(recon.PAT_DTE_EFFECTIVE_5, 7, 2)) between 1 and 30)
--         or (to_number(SUBSTR(recon.PAT_DTE_EFFECTIVE_5, 5, 2)) IN (08,05,01,12,03,07,10) AND to_number(SUBSTR(recon.PAT_DTE_EFFECTIVE_5, 7, 2)) between 1 and 31)
--         or (to_number(SUBSTR(recon.PAT_DTE_EFFECTIVE_5, 5, 2)) IN (02) AND to_number(SUBSTR(recon.PAT_DTE_EFFECTIVE_5, 7, 2)) between 1 and 28)
--        )
--        and   to_number(SUBSTR(decode(recon.PAT_DTE_END_5,'00000000',22991231,'        ',22991231,recon.PAT_DTE_END_5) , 5, 2)) between 1 and 12 
--        and  to_number(SUBSTR(decode(recon.PAT_DTE_END_5,'00000000',22991231,'        ',22991231,recon.PAT_DTE_END_5), 7, 2)) between 1 and 31 
--        and ( to_number(SUBSTR(decode(recon.PAT_DTE_END_5,'00000000',22991231,'        ',22991231,recon.PAT_DTE_END_5), 1, 4)) BETWEEN 1900 AND 2026
--          or to_number(SUBSTR(decode(recon.PAT_DTE_END_5,'00000000',22991231,'        ',22991231,recon.PAT_DTE_END_5), 1, 4)) = 2299  ) -- include the upcoming year towards end of the year
--        and ( ( to_number(SUBSTR(decode(recon.PAT_DTE_END_5,'00000000',22991231,'        ',22991231,recon.PAT_DTE_END_5), 5, 2)) IN (09,04,06,11) 
--                   AND to_number(SUBSTR(decode(recon.PAT_DTE_END_5,'00000000',22991231,'        ',22991231,recon.PAT_DTE_END_5),7, 2))between 1 and 30)
--        or ( to_number(SUBSTR(decode(recon.PAT_DTE_END_5,'00000000',22991231,'        ',22991231,recon.PAT_DTE_END_5), 5, 2)) IN (08,05,01,12,03,07,10) 
--                   AND to_number(SUBSTR(decode(recon.PAT_DTE_END_5,'00000000',22991231,'        ',22991231,recon.PAT_DTE_END_5), 7, 2)) between 1 and 31)
--        or ( to_number(SUBSTR(decode(recon.PAT_DTE_END_5,'00000000',22991231,'        ',22991231,recon.PAT_DTE_END_5), 5, 2)) IN (02)
--                  AND to_number(SUBSTR(decode(recon.PAT_DTE_END_5,'00000000',22991231,'        ',22991231,recon.PAT_DTE_END_5), 7, 2)) between 1 and 29)
--        )
        and not exists ( select 1
                from T_RE_PAT_LIAB pat
                   where m.sak_Recip = pat.sak_recip 
                    and to_number(PAT_DTE_EFFECTIVE_5) between pat.DTE_EFFECTIVE and pat.DTE_END
                     and pat.AMT_PATNT_LIAB = to_number(substr(AMT_PATNT_LIAB_5,1,7)||'.'||substr(AMT_PATNT_LIAB_5,8,2)) -- amount matches  
            )
        and exists ( select 1
                from T_RE_PAT_LIAB pat
                   where m.sak_Recip = pat.sak_recip 
                   and to_number(decode(recon.PAT_DTE_END_5,'00000000',22991231,'        ',22991231,recon.PAT_DTE_END_5)) 
                     between pat.DTE_EFFECTIVE and pat.DTE_END
                       and pat.AMT_PATNT_LIAB = to_number(substr(AMT_PATNT_LIAB_5,1,7)||'.'||substr(AMT_PATNT_LIAB_5,8,2)) -- amount matches  
                                )
--and not exists ( select 1 from T_RE_TEDS_TRANHIST_RELIG perr
--            where trim(perr.id_medicaid) = trim(recon.id_medicaid)
--                    and perr.dte_added = 20241025
--                    and recon.SAK_TRAN_RELIG = perr.sak_tran_relig    
--                    and   ( cde_Error1 = 'L0088'
--                    or cde_Error2 = 'L0088'
--                    or cde_Error3 = 'L0088'
--                    or cde_Error4 = 'L0088'
--                    or cde_Error5 = 'L0088'
--                    or cde_Error6 = 'L0088'
--                    or cde_Error7 = 'L0088'
--                    or cde_Error8 = 'L0088'
--                    or cde_Error9 = 'L0088'
--                    or cde_Error10 = 'L0088'
--                    )  
--                    )    
 								
;

select id_medicaid
 from I23_L0098_D102524
--where id_medicaid = 'TD504548053'
minus
select id_medicaid
  from t_re_teds_tranhist_relig
  where dte_Added = 20241025
  and 
   ( cde_Error1 = 'L0098'
or cde_Error2 = 'L0098'
or cde_Error3 = 'L0098'
or cde_Error4 = 'L0098'
or cde_Error5 = 'L0098'
or cde_Error6 = 'L0098'
or cde_Error7 = 'L0098'
or cde_Error8 = 'L0098'
or cde_Error9 = 'L0098'
or cde_Error10 = 'L0098'
)
minus
select id_medicaid
 from I23_L0098_D102524
;

select count from I23_L0098_D102524