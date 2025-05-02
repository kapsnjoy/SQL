--6296
desc t_re_teds_tranhist;

select 
id_medicaid
,CDE_RACE
,CDE_RACE_1
,CDE_RACE_2
,CDE_RACE_3
,CDE_RACE_4
,CDE_RACE_5
,CDE_RACE_6
,CDE_RACE_7
,CDE_RACE_8
,CDE_RACE_9
,CDE_RACE_10
,CDE_RACE_11
,CDE_RACE_12
,CDE_RACE_13
,CDE_RACE_14
,CDE_RACE_15
,CDE_RACE_16
,CDE_RACE_17
,CDE_RACE_18
,CDE_RACE_19
,CDE_RACE_20
,CDE_RACE_21
,CDE_RACE_22
,CDE_RACE_23
,CDE_RACE_24
,CDE_RACE_25
,CDE_RACE_26
,cde_error1
,cde_error2
,cde_error3
,cde_error4
,cde_error5
,cde_error6
,cde_error7
,cde_error8
,cde_error9
,cde_error10
from 
 t_re_teds_tranhist
where
 dte_Added = 20231002 and
(
( CDE_RACE_1 <> ' ' and CDE_RACE_1 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_2 <> ' ' and CDE_RACE_2 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_3 <> ' ' and CDE_RACE_3 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_4 <> ' ' and CDE_RACE_4 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_5 <> ' ' and CDE_RACE_5 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_6 <> ' ' and CDE_RACE_6 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_7 <> ' ' and CDE_RACE_7 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_8 <> ' ' and CDE_RACE_8 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_9 <> ' ' and CDE_RACE_9 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_10 <> ' ' and CDE_RACE_10 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_11 <> ' ' and CDE_RACE_11 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_12 <> ' ' and CDE_RACE_12 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_13 <> ' ' and CDE_RACE_13 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_14 <> ' ' and CDE_RACE_14 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_15 <> ' ' and CDE_RACE_15 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_16 <> ' ' and CDE_RACE_16 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_17 <> ' ' and CDE_RACE_17 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_18 <> ' ' and CDE_RACE_18 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_19 <> ' ' and CDE_RACE_19 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_20 <> ' ' and CDE_RACE_20 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_21 <> ' ' and CDE_RACE_21 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_22 <> ' ' and CDE_RACE_22 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_23 <> ' ' and CDE_RACE_23 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_24 <> ' ' and CDE_RACE_24 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_25 <> ' ' and CDE_RACE_25 not in (select cde_race_teds from t_re_race_crosswalk ))
or ( CDE_RACE_26 <> ' ' and CDE_RACE_26 not in (select cde_race_teds from t_re_race_crosswalk ))

);
 
 select * from t_re_race_crosswalk;

-- 6297

select 
id_medicaid
,CDE_RACE
,CDE_RACE_1
,CDE_RACE_2
,CDE_RACE_3
,CDE_RACE_4
,CDE_RACE_5
,CDE_RACE_6
,CDE_RACE_7
,CDE_RACE_8
,CDE_RACE_9
,CDE_RACE_10
,CDE_RACE_11
,CDE_RACE_12
,CDE_RACE_13
,CDE_RACE_14
,CDE_RACE_15
,CDE_RACE_16
,CDE_RACE_17
,CDE_RACE_18
,CDE_RACE_19
,CDE_RACE_20
,CDE_RACE_21
,CDE_RACE_22
,CDE_RACE_23
,CDE_RACE_24
,CDE_RACE_25
,CDE_RACE_26
,cde_error1
,cde_error2
,cde_error3
,cde_error4
,cde_error5
,cde_error6
,cde_error7
,cde_error8
,cde_error9
,cde_error10
from 
 t_re_teds_tranhist
where
 dte_Added = 20231004
--and sak_tran > 25802912 
and 
(
(cde_race_2 <> ' ' and cde_race_2 in ('A','S')) or
(cde_race_3 <> ' ' and cde_race_3 in ('A','S')) or
(cde_race_4 <> ' ' and cde_race_4 in ('A','S')) or
(cde_race_5 <> ' ' and cde_race_5 in ('A','S')) or
(cde_race_6 <> ' ' and cde_race_6 in ('A','S')) or
(cde_race_7 <> ' ' and cde_race_7 in ('A','S')) or
(cde_race_8 <> ' ' and cde_race_8 in ('A','S')) or
(cde_race_9 <> ' ' and cde_race_9 in ('A','S')) or
(cde_race_10 <> ' ' and cde_race_10 in ('A','S')) or
(cde_race_11 <> ' ' and cde_race_11 in ('A','S')) or
(cde_race_12 <> ' ' and cde_race_12 in ('A','S')) or
(cde_race_13 <> ' ' and cde_race_13 in ('A','S')) or
(cde_race_14 <> ' ' and cde_race_14 in ('A','S')) or
(cde_race_15 <> ' ' and cde_race_15 in ('A','S')) or
(cde_race_16 <> ' ' and cde_race_16 in ('A','S')) or
(cde_race_17 <> ' ' and cde_race_17 in ('A','S')) or
(cde_race_18 <> ' ' and cde_race_18 in ('A','S')) or
(cde_race_19 <> ' ' and cde_race_19 in ('A','S')) or
(cde_race_20 <> ' ' and cde_race_20 in ('A','S')) or
(cde_race_21 <> ' ' and cde_race_21 in ('A','S')) or
(cde_race_22 <> ' ' and cde_race_22 in ('A','S')) or
(cde_race_23 <> ' ' and cde_race_23 in ('A','S')) or
(cde_race_24 <> ' ' and cde_race_24 in ('A','S')) or
(cde_race_25 <> ' ' and cde_race_25 in ('A','S')) or
(cde_race_26 <> ' ' and cde_race_26 in ('A','S')) 
);


-- 6298

select 
id_medicaid
,CDE_RACE
,CDE_RACE_1
,CDE_RACE_2
,CDE_RACE_3
,CDE_RACE_4
,CDE_RACE_5
,CDE_RACE_6
,CDE_RACE_7
,CDE_RACE_8
,CDE_RACE_9
,CDE_RACE_10
,CDE_RACE_11
,CDE_RACE_12
,CDE_RACE_13
,CDE_RACE_14
,CDE_RACE_15
,CDE_RACE_16
,CDE_RACE_17
,CDE_RACE_18
,CDE_RACE_19
,CDE_RACE_20
,CDE_RACE_21
,CDE_RACE_22
,CDE_RACE_23
,CDE_RACE_24
,CDE_RACE_25
,CDE_RACE_26
,cde_error1
,cde_error2
,cde_error3
,cde_error4
,cde_error5
,cde_error6
,cde_error7
,cde_error8
,cde_error9
,cde_error10
from 
 t_re_teds_tranhist
where
 dte_Added = 20231002 and
(
  ( Cde_race_1 = 'S' and CDE_RACE_2 <> ' ' and CDE_RACE_2  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_3 <> ' ' and CDE_RACE_3  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_4 <> ' ' and CDE_RACE_4  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_5 <> ' ' and CDE_RACE_5  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_6 <> ' ' and CDE_RACE_6  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_7 <> ' ' and CDE_RACE_7  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_8 <> ' ' and CDE_RACE_8  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_9 <> ' ' and CDE_RACE_9  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_10 <> ' ' and CDE_RACE_10  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_11 <> ' ' and CDE_RACE_11  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_12 <> ' ' and CDE_RACE_12  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_13 <> ' ' and CDE_RACE_13  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_14 <> ' ' and CDE_RACE_14  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_15 <> ' ' and CDE_RACE_15  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_16 <> ' ' and CDE_RACE_16  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_17 <> ' ' and CDE_RACE_17  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_18 <> ' ' and CDE_RACE_18  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_19 <> ' ' and CDE_RACE_19  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_20 <> ' ' and CDE_RACE_20  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_21 <> ' ' and CDE_RACE_21  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_22 <> ' ' and CDE_RACE_22  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_23 <> ' ' and CDE_RACE_23  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_24 <> ' ' and CDE_RACE_24  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_25 <> ' ' and CDE_RACE_25  in (select cde_race_teds from t_re_race_crosswalk ))
or ( Cde_race_1 = 'S' and CDE_RACE_26 <> ' ' and CDE_RACE_26  in (select cde_race_teds from t_re_race_crosswalk ))
);

--6301

 select 
hist.id_medicaid
,cde_race
,CDE_RACE_1
,CDE_RACE_2
,CDE_RACE_3
,CDE_RACE_4
,CDE_RACE_5
,CDE_RACE_6
,CDE_RACE_7
,CDE_RACE_8
,CDE_RACE_9
,CDE_RACE_10
,CDE_RACE_11
,CDE_RACE_12
,CDE_RACE_13
,CDE_RACE_14
,CDE_RACE_15
,CDE_RACE_16
,CDE_RACE_17
,CDE_RACE_18
,CDE_RACE_19
,CDE_RACE_20
,CDE_RACE_21
,CDE_RACE_22
,CDE_RACE_23
,CDE_RACE_24
,CDE_RACE_25
,CDE_RACE_26
,cde_error1
,cde_error2
,cde_error3
,cde_error4
,cde_error5
,cde_error6
,cde_error7
,cde_error8
,cde_error9
,cde_error10
from  
t_re_teds_tranhist hist
where
     hist.dte_Added = 20231004
--and sak_tran > 25802912    
and (
        (hist.cde_race_1 = 'A' and hist.cde_race <> '  ' and hist.cde_Race not in ('I','G'))
     or (hist.cde_race in ('I','G') and ( hist.cde_race_1 = ' ' or (hist.cde_race_1 <> ' ' and hist.cde_Race_1 not in ('A'))))
     or (hist.cde_race_1 in ('S') and hist.cde_race <> '  ' and hist.cde_Race not in ('7'))
 );

desc t_re_base;

--6303 ethnic-cd

select 
hist.id_medicaid
,hist.CDE_ETHNIC
,CDE_RACE
,CDE_RACE_1
,CDE_RACE_2
,CDE_RACE_3
,CDE_RACE_4
,CDE_RACE_5
,CDE_RACE_6
,CDE_RACE_7
,CDE_RACE_8
,CDE_RACE_9
,CDE_RACE_10
,CDE_RACE_11
,CDE_RACE_12
,CDE_RACE_13
,CDE_RACE_14
,CDE_RACE_15
,CDE_RACE_16
,CDE_RACE_17
,CDE_RACE_18
,CDE_RACE_19
,CDE_RACE_20
,CDE_RACE_21
,CDE_RACE_22
,CDE_RACE_23
,CDE_RACE_24
,CDE_RACE_25
,CDE_RACE_26
,cde_error1
,cde_error2
,cde_error3
,cde_error4
,cde_error5
,cde_error6
,cde_error7
,cde_error8
,cde_error9
,cde_error10
from 
 t_re_teds_tranhist hist
where
     hist.dte_Added = 20231002
and ( cde_ethnic = '  ' or ( cde_ethnic <> '  ' and cde_ethnic not in (select cde_ethnic from t_cde_ethnic)));

select * from t_cde_ethnic;

-- 6302

 select 
 --count(distinct hist.id_medicaid)
 hist.id_medicaid
,hist.cde_race
,CDE_RACE_1
,CDE_RACE_2
,CDE_RACE_3
,CDE_RACE_4
,CDE_RACE_5
,CDE_RACE_6
,CDE_RACE_7
,CDE_RACE_8
,CDE_RACE_9
,CDE_RACE_10
,CDE_RACE_11
,CDE_RACE_12
,CDE_RACE_13
,CDE_RACE_14
,CDE_RACE_15
,CDE_RACE_16
,CDE_RACE_17
,CDE_RACE_18
,CDE_RACE_19
,CDE_RACE_20
,CDE_RACE_21
,CDE_RACE_22
,CDE_RACE_23
,CDE_RACE_24
,CDE_RACE_25
,CDE_RACE_26
,cde_error1
,cde_error2
,cde_error3
,cde_error4
,cde_error5
,cde_error6
,cde_error7
,cde_error8
,cde_error9
,cde_error10
from 
 t_re_teds_tranhist hist
where
     hist.dte_Added = 20231004
--and sak_tran <= 25802912     
and (
   hist.cde_race_1 = ' ' 
or hist.cde_race = '  ' 
or length(hist.cde_Race) > 2
or hist.cde_race is null
or (hist.cde_race <> '  ' and regexp_instr(trim(hist.cde_race),'[0,1,2,3,4,5,6,8,9]') > 0 )
--or (m.cde_race <> '  ' and regexp_instr(trim(m.cde_race),'[[:alpha:]]') = 0) -- include alpha or '7'
or (hist.cde_race <> '  ' and hist.cde_race not in (select cde_race from t_cde_race))
);

-- MMIS Race-cd
select * from t_cde_race;



select * from t_cde_race;

-- 6300 
-- returns the positions as different rows

with concatrace as
(  select 
 id_medicaid
,CDE_RACE_1
||CDE_RACE_2
||CDE_RACE_3
||CDE_RACE_4
||CDE_RACE_5
||CDE_RACE_6
||CDE_RACE_7
||CDE_RACE_8
||CDE_RACE_9
||CDE_RACE_10
||CDE_RACE_11
||CDE_RACE_12
||CDE_RACE_13
||CDE_RACE_14
||CDE_RACE_15
||CDE_RACE_16
||CDE_RACE_17
||CDE_RACE_18
||CDE_RACE_19
||CDE_RACE_20
||CDE_RACE_21
||CDE_RACE_22
||CDE_RACE_23
||CDE_RACE_24
||CDE_RACE_25
||CDE_RACE_26 as race_combined
,cde_error1
,cde_error2
,cde_error3
,cde_error4
,cde_error5
,cde_error6
,cde_error7
,cde_error8
,cde_error9
,cde_error10
from 
 t_re_teds_tranhist
where
     dte_Added = 20231002
)  
select id_medicaid, race_combined,instr(rtrim(substr(race_combined,2,26)), ' ') as pos
,cde_error1
,cde_error2
,cde_error3
,cde_error4
,cde_error5
,cde_error6
,cde_error7
,cde_error8
,cde_error9
,cde_error10
--, count(distinct pos)
from concatrace
 -- connect by level <=length(rtrim(race_combined))
where nvl(instr(rtrim(substr(race_combined,2,26)), ' '), 0) <> 0
;
     

-- step#1 
 select instr(trim('ABCDEFG HIJK LMNPRS         '), ' ') as pos
  from dual;
-- step#2 count positions returned as rows



--6202 renewal dates
select 
id_medicaid
,dte_added
,dte_pkt_received
,to_date(dte_pkt_received,'YYYYMMDD')
,dte_pkt_sent
,to_date(dte_pkt_sent,'YYYYMMDD') - 30
,cde_error1
,cde_error2
,cde_error3
,cde_error4
,cde_error5
,cde_error6
,cde_error7
,cde_error8
,cde_error9
,cde_error10
from 
 t_re_teds_tranhist
where
 dte_Added = 20240111
 and dte_pkt_sent > 0
 and dte_pkt_Received > 0
 and to_date( dte_pkt_received,'YYYYMMDD') <= to_date(dte_pkt_sent,'YYYYMMDD') - 30
;

--old 6202 pre-edit


select 
id_medicaid
,dte_added
,dte_pkt_received
,to_date(dte_pkt_received,'YYYYMMDD')
,dte_pkt_sent
,to_date(dte_pkt_sent,'YYYYMMDD') 
,cde_error1
,cde_error2
,cde_error3
,cde_error4
,cde_error5
,cde_error6
,cde_error7
,cde_error8
,cde_error9
,cde_error10
from 
 t_re_teds_tranhist
where
 dte_Added = 20230929
 and dte_pkt_sent > 0
 and dte_pkt_Received > 0
 and to_date( dte_pkt_received,'YYYYMMDD') < to_date(dte_pkt_sent,'YYYYMMDD')
 -- and to_date( dte_pkt_received,'YYYYMMDD') < to_date(dte_pkt_sent,'YYYYMMDD') - 30

;

desc  t_re_teds_tranresp;
 
--6299 duplicates
 select 
--count( id_medicaid)
id_medicaid
, CDE_RACE
,CDE_RACE_1
||CDE_RACE_2
||CDE_RACE_3
||CDE_RACE_4
||CDE_RACE_5
||CDE_RACE_6
||CDE_RACE_7
||CDE_RACE_8
||CDE_RACE_9
||CDE_RACE_10
||CDE_RACE_11
||CDE_RACE_12
||CDE_RACE_13
||CDE_RACE_14
||CDE_RACE_15
||CDE_RACE_16
||CDE_RACE_17
||CDE_RACE_18
||CDE_RACE_19
||CDE_RACE_20
||CDE_RACE_21
||CDE_RACE_22
||CDE_RACE_23
||CDE_RACE_24
||CDE_RACE_25
||CDE_RACE_26 as race_combined
,cde_error1
,cde_error2
,cde_error3
,cde_error4
,cde_error5
,cde_error6
,cde_error7
,cde_error8
,cde_error9
,cde_error10
from 
 t_re_teds_tranhist
where
 dte_Added = 20231002
and
( Case 
when cde_race_1 <> ' ' then 
    case when ( (cde_race_1 = cde_race_2) or (cde_race_1 = cde_race_3) or (cde_race_1 = cde_race_4)or (cde_race_1 = cde_race_5)or (cde_race_1 = cde_race_6)
    or (cde_race_1 = cde_race_7) or (cde_race_1 = cde_race_8) or (cde_race_1 = cde_race_9)or (cde_race_1 = cde_race_10  )or (cde_race_1 = cde_race_11)
    or (cde_race_1 = cde_race_12) or (cde_race_1 = cde_race_13) or (cde_race_1 = cde_race_14)or (cde_race_1 = cde_race_15 )or (cde_race_1 = cde_race_16)
    or (cde_race_1 = cde_race_17) or (cde_race_1 = cde_race_18) or (cde_race_1 = cde_race_19)or (cde_race_1 = cde_race_20  )or (cde_race_1 = cde_race_21)
    or (cde_race_1 = cde_race_22) or (cde_race_1 = cde_race_23) or (cde_race_1 = cde_race_24)or (cde_race_1 = cde_race_25  )or (cde_race_1 = cde_race_26)
    )  then  'duplicate'
       else  'Not dup'
    end  
when  cde_race_2 <> ' ' then
    case when ( (cde_race_2 = cde_race_1) or (cde_race_2 = cde_race_3) or (cde_race_2 = cde_race_4)or (cde_race_2 = cde_race_5)or (cde_race_2 = cde_race_6)
    or (cde_race_2 = cde_race_7) or (cde_race_2 = cde_race_8) or (cde_race_2 = cde_race_9) or (cde_race_2 = cde_race_10 )or (cde_race_2 = cde_race_11)
    or (cde_race_2 = cde_race_12) or (cde_race_2 = cde_race_20) or (cde_race_2 = cde_race_13)or (cde_race_2 = cde_race_14 )or (cde_race_2 = cde_race_15)
    or (cde_race_2 = cde_race_16) or (cde_race_2 = cde_race_17) or (cde_race_2 = cde_race_18)or (cde_race_2 = cde_race_19  )or (cde_race_2 = cde_race_21)
    or (cde_race_2 = cde_race_22) or (cde_race_2 = cde_race_23) or (cde_race_2 = cde_race_24)or (cde_race_2 = cde_race_25  )or (cde_race_2 = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
    end 
when  cde_race_3 <> ' ' then
    case when ( (cde_race_3  = cde_race_1) or (cde_race_3  = cde_race_2) or (cde_race_3  = cde_race_4)or (cde_race_3  = cde_race_5)or (cde_race_3  = cde_race_6)
    or (cde_race_3  = cde_race_7) or (cde_race_3  = cde_race_8) or (cde_race_3  = cde_race_9) or (cde_race_3  = cde_race_10 )or (cde_race_3  = cde_race_11)
    or (cde_race_3  = cde_race_12) or (cde_race_3  = cde_race_20) or (cde_race_3  = cde_race_13)or (cde_race_3  = cde_race_14 )or (cde_race_3  = cde_race_15)
    or (cde_race_3  = cde_race_16) or (cde_race_3  = cde_race_17) or (cde_race_3  = cde_race_18)or (cde_race_3  = cde_race_19  )or (cde_race_3  = cde_race_21)
    or (cde_race_3  = cde_race_22) or (cde_race_3  = cde_race_23) or (cde_race_3  = cde_race_24)or (cde_race_3  = cde_race_25  )or (cde_race_3  = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
    end 
when  cde_race_4 <> ' ' then
    case when ( (cde_race_4    = cde_race_1) or (cde_race_4    = cde_race_3) or (cde_race_4    = cde_race_2)or (cde_race_4    = cde_race_5)or (cde_race_4    = cde_race_6)
    or (cde_race_4    = cde_race_7) or (cde_race_4    = cde_race_8) or (cde_race_4    = cde_race_9) or (cde_race_4    = cde_race_10 )or (cde_race_4    = cde_race_11)
    or (cde_race_4    = cde_race_12) or (cde_race_4    = cde_race_20) or (cde_race_4    = cde_race_13)or (cde_race_4    = cde_race_14 )or (cde_race_4    = cde_race_15)
    or (cde_race_4    = cde_race_16) or (cde_race_4    = cde_race_17) or (cde_race_4    = cde_race_18)or (cde_race_4    = cde_race_19  )or (cde_race_4    = cde_race_21)
    or (cde_race_4    = cde_race_22) or (cde_race_4    = cde_race_23) or (cde_race_4    = cde_race_24)or (cde_race_4    = cde_race_25  )or (cde_race_4    = cde_race_26)
    ) then 'duplicate'
       else  'Not dup'
    end
when  cde_race_5 <> ' ' then
 case when ( (cde_race_5  = cde_race_1) or (cde_race_5 = cde_race_3) or (cde_race_5 = cde_race_4)or (cde_race_5 = cde_race_2)or (cde_race_5 = cde_race_6)
    or (cde_race_5 = cde_race_7) or (cde_race_5 = cde_race_8) or (cde_race_5 = cde_race_9) or (cde_race_5 = cde_race_10 )or (cde_race_5 = cde_race_11)
    or (cde_race_5 = cde_race_12) or (cde_race_5 = cde_race_20) or (cde_race_5 = cde_race_13)or (cde_race_5 = cde_race_14 )or (cde_race_5  = cde_race_15)
    or (cde_race_5 = cde_race_16) or (cde_race_5 = cde_race_17) or (cde_race_5 = cde_race_18)or (cde_race_5 = cde_race_19  )or (cde_race_5 = cde_race_21)
    or (cde_race_5 = cde_race_22) or (cde_race_5 = cde_race_23) or (cde_race_5 = cde_race_24)or (cde_race_5 = cde_race_25  )or (cde_race_5 = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end   
when  cde_race_6 <> ' ' then
 case when ( (cde_race_6  = cde_race_1) or (cde_race_6 = cde_race_3) or (cde_race_6 = cde_race_4)or (cde_race_6 = cde_race_2)or (cde_race_6 = cde_race_5)
    or (cde_race_6 = cde_race_7) or (cde_race_6 = cde_race_8) or (cde_race_6 = cde_race_9) or (cde_race_6 = cde_race_10 )or (cde_race_6 = cde_race_11)
    or (cde_race_6 = cde_race_12) or (cde_race_6 = cde_race_20) or (cde_race_6 = cde_race_13)or (cde_race_6 = cde_race_14 )or (cde_race_6  = cde_race_15)
    or (cde_race_6 = cde_race_16) or (cde_race_6 = cde_race_17) or (cde_race_6 = cde_race_18)or (cde_race_6 = cde_race_19  )or (cde_race_6 = cde_race_21)
    or (cde_race_6 = cde_race_22) or (cde_race_6 = cde_race_23) or (cde_race_6 = cde_race_24)or (cde_race_6 = cde_race_25  )or (cde_race_6 = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
 end     
when  cde_race_7 <> ' ' then
 case when ( (cde_race_7  = cde_race_1) or (cde_race_7 = cde_race_3) or (cde_race_7 = cde_race_4)or (cde_race_7 = cde_race_2)or (cde_race_7 = cde_race_6)
    or (cde_race_7 = cde_race_5) or (cde_race_7 = cde_race_8) or (cde_race_7 = cde_race_9) or (cde_race_7 = cde_race_10 )or (cde_race_7 = cde_race_11)
    or (cde_race_7 = cde_race_12) or (cde_race_7 = cde_race_20) or (cde_race_7 = cde_race_13)or (cde_race_7 = cde_race_14 )or (cde_race_7  = cde_race_15)
    or (cde_race_7 = cde_race_16) or (cde_race_7 = cde_race_17) or (cde_race_7 = cde_race_18)or (cde_race_7 = cde_race_19  )or (cde_race_7 = cde_race_21)
    or (cde_race_7 = cde_race_22) or (cde_race_7 = cde_race_23) or (cde_race_7 = cde_race_24)or (cde_race_7 = cde_race_25  )or (cde_race_7 = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end   
when  cde_race_8 <> ' ' then
case when ( (cde_race_8   = cde_race_1) or (cde_race_8  = cde_race_3) or (cde_race_8  = cde_race_4)or (cde_race_8  = cde_race_2)or (cde_race_8  = cde_race_6)
    or (cde_race_8  = cde_race_5) or (cde_race_8  = cde_race_7) or (cde_race_8  = cde_race_9) or (cde_race_8  = cde_race_10 )or (cde_race_8  = cde_race_11)
    or (cde_race_8  = cde_race_12) or (cde_race_8  = cde_race_20) or (cde_race_8  = cde_race_13)or (cde_race_8  = cde_race_14 )or (cde_race_8   = cde_race_15)
    or (cde_race_8  = cde_race_16) or (cde_race_8  = cde_race_17) or (cde_race_8  = cde_race_18)or (cde_race_8  = cde_race_19  )or (cde_race_8  = cde_race_21)
    or (cde_race_8  = cde_race_22) or (cde_race_8  = cde_race_23) or (cde_race_8  = cde_race_24)or (cde_race_8  = cde_race_25  )or (cde_race_8  = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end   
when  cde_race_9 <> ' ' then
 case when ( (cde_race_9    = cde_race_1) or (cde_race_9   = cde_race_3) or (cde_race_9   = cde_race_4)or (cde_race_9   = cde_race_2)or (cde_race_9   = cde_race_6)
    or (cde_race_9   = cde_race_5) or (cde_race_9   = cde_race_7) or (cde_race_9   = cde_race_8) or (cde_race_9   = cde_race_10 )or (cde_race_9   = cde_race_11)
    or (cde_race_9   = cde_race_12) or (cde_race_9   = cde_race_20) or (cde_race_9   = cde_race_13)or (cde_race_9   = cde_race_14 )or (cde_race_9    = cde_race_15)
    or (cde_race_9   = cde_race_16) or (cde_race_9   = cde_race_17) or (cde_race_9   = cde_race_18)or (cde_race_9   = cde_race_19  )or (cde_race_9   = cde_race_21)
    or (cde_race_9   = cde_race_22) or (cde_race_9   = cde_race_23) or (cde_race_9   = cde_race_24)or (cde_race_9   = cde_race_25  )or (cde_race_9   = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end   
when  cde_race_10 <> ' ' then
 case when ( (cde_race_10    = cde_race_1) or (cde_race_10   = cde_race_3) or (cde_race_10   = cde_race_4)or (cde_race_10   = cde_race_2)or (cde_race_10   = cde_race_6)
    or (cde_race_10   = cde_race_5) or (cde_race_10   = cde_race_7) or (cde_race_10   = cde_race_8) or (cde_race_10   = cde_race_9 )or (cde_race_10   = cde_race_11)
    or (cde_race_10   = cde_race_12) or (cde_race_10   = cde_race_20) or (cde_race_10   = cde_race_13)or (cde_race_10   = cde_race_14 )or (cde_race_10    = cde_race_15)
    or (cde_race_10   = cde_race_16) or (cde_race_10   = cde_race_17) or (cde_race_10   = cde_race_18)or (cde_race_10   = cde_race_19  )or (cde_race_10   = cde_race_21)
    or (cde_race_10   = cde_race_22) or (cde_race_10   = cde_race_23) or (cde_race_10   = cde_race_24)or (cde_race_10   = cde_race_25  )or (cde_race_10   = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end
when  cde_race_11  <> ' ' then
 case when ( (cde_race_11  = cde_race_1) or (cde_race_11   = cde_race_3) or (cde_race_11    = cde_race_4)or (cde_race_11    = cde_race_2)or (cde_race_11    = cde_race_6)
    or (cde_race_11   = cde_race_5) or (cde_race_11   = cde_race_7) or (cde_race_11   = cde_race_8) or (cde_race_11    = cde_race_9 )or (cde_race_11    = cde_race_10)
    or (cde_race_11   = cde_race_12) or (cde_race_11   = cde_race_20) or (cde_race_11   = cde_race_13)or (cde_race_11    = cde_race_14 )or (cde_race_11     = cde_race_15)
    or (cde_race_11   = cde_race_16) or (cde_race_11   = cde_race_17) or (cde_race_11   = cde_race_18)or (cde_race_11    = cde_race_19  )or (cde_race_11    = cde_race_21)
    or (cde_race_11   = cde_race_22) or (cde_race_11   = cde_race_23) or (cde_race_11   = cde_race_24)or (cde_race_11    = cde_race_25  )or (cde_race_11    = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end
when  cde_race_12  <> ' ' then
 case when ( (cde_race_12  = cde_race_1) or (cde_race_12   = cde_race_3) or (cde_race_12    = cde_race_4)or (cde_race_12    = cde_race_2)or (cde_race_12    = cde_race_6)
    or (cde_race_12   = cde_race_5) or (cde_race_12   = cde_race_7) or (cde_race_12   = cde_race_8) or (cde_race_12    = cde_race_9 )or (cde_race_12    = cde_race_10)
    or (cde_race_12   = cde_race_11) or (cde_race_12   = cde_race_20) or (cde_race_12   = cde_race_13)or (cde_race_12   = cde_race_14 )or (cde_race_12     = cde_race_15)
    or (cde_race_12   = cde_race_16) or (cde_race_12   = cde_race_17) or (cde_race_12   = cde_race_18)or (cde_race_12   = cde_race_19  )or (cde_race_12    = cde_race_21)
    or (cde_race_12   = cde_race_22) or (cde_race_12   = cde_race_23) or (cde_race_12   = cde_race_24)or (cde_race_12   = cde_race_25  )or (cde_race_12    = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end
 when  cde_race_13  <> ' ' then
 case when ( (cde_race_13  = cde_race_1) or (cde_race_13   = cde_race_3) or (cde_race_13   = cde_race_4)or (cde_race_13   = cde_race_2)or (cde_race_13   = cde_race_6)
    or (cde_race_13   = cde_race_5) or (cde_race_13   = cde_race_7) or (cde_race_13   = cde_race_8) or (cde_race_13    = cde_race_9 )or (cde_race_13    = cde_race_10)
    or (cde_race_13   = cde_race_11) or (cde_race_13   = cde_race_20) or (cde_race_13   = cde_race_12)or (cde_race_13   = cde_race_14 )or (cde_race_13     = cde_race_15)
    or (cde_race_13   = cde_race_16) or (cde_race_13   = cde_race_17) or (cde_race_13   = cde_race_18)or (cde_race_13   = cde_race_19  )or (cde_race_13    = cde_race_21)
    or (cde_race_13   = cde_race_22) or (cde_race_13   = cde_race_23) or (cde_race_13   = cde_race_24)or (cde_race_13   = cde_race_25  )or (cde_race_13    = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end
 when  cde_race_14  <> ' ' then
 case when ( (cde_race_14  = cde_race_1) or (cde_race_14  = cde_race_3) or (cde_race_14  = cde_race_4)or (cde_race_14   = cde_race_2)or (cde_race_14   = cde_race_6)
    or (cde_race_14   = cde_race_5) or (cde_race_14   = cde_race_7) or (cde_race_14   = cde_race_8) or (cde_race_14    = cde_race_9 )or (cde_race_14    = cde_race_10)
    or (cde_race_14   = cde_race_11) or (cde_race_14   = cde_race_20) or (cde_race_14   = cde_race_12)or (cde_race_14   = cde_race_13 )or (cde_race_14    = cde_race_15)
    or (cde_race_14   = cde_race_16) or (cde_race_14   = cde_race_17) or (cde_race_14   = cde_race_18)or (cde_race_14   = cde_race_19  )or (cde_race_14   = cde_race_21)
    or (cde_race_14   = cde_race_22) or (cde_race_14   = cde_race_23) or (cde_race_14   = cde_race_24)or (cde_race_14   = cde_race_25  )or (cde_race_14   = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end
 when  cde_race_15  <> ' ' then
 case when ( (cde_race_15  = cde_race_1) or (cde_race_15  = cde_race_3) or (cde_race_15  = cde_race_4)or (cde_race_15   = cde_race_2)or (cde_race_15   = cde_race_6)
    or (cde_race_15   = cde_race_5) or (cde_race_15   = cde_race_7) or (cde_race_15   = cde_race_8) or (cde_race_15    = cde_race_9 )or (cde_race_15    = cde_race_10)
    or (cde_race_15   = cde_race_11) or (cde_race_15   = cde_race_20) or (cde_race_15   = cde_race_12)or (cde_race_15   = cde_race_13 )or (cde_race_15    = cde_race_14)
    or (cde_race_15   = cde_race_16) or (cde_race_15   = cde_race_17) or (cde_race_15   = cde_race_18)or (cde_race_15   = cde_race_19  )or (cde_race_15   = cde_race_21)
    or (cde_race_15   = cde_race_22) or (cde_race_15   = cde_race_23) or (cde_race_15   = cde_race_24)or (cde_race_15   = cde_race_25  )or (cde_race_15   = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end
 when  cde_race_16  <> ' ' then
 case when ( (cde_race_16  = cde_race_1) or (cde_race_16  = cde_race_3) or (cde_race_16  = cde_race_4)or (cde_race_16   = cde_race_2)or (cde_race_16   = cde_race_6)
    or (cde_race_16   = cde_race_5) or (cde_race_16   = cde_race_7) or (cde_race_16   = cde_race_8) or (cde_race_16    = cde_race_9 )or (cde_race_16    = cde_race_10)
    or (cde_race_16   = cde_race_11) or (cde_race_16   = cde_race_20) or (cde_race_16   = cde_race_12)or (cde_race_16   = cde_race_13 )or (cde_race_16    = cde_race_14)
    or (cde_race_16   = cde_race_15) or (cde_race_16   = cde_race_17) or (cde_race_16   = cde_race_18)or (cde_race_16   = cde_race_19  )or (cde_race_16   = cde_race_21)
    or (cde_race_16   = cde_race_22) or (cde_race_16   = cde_race_23) or (cde_race_16   = cde_race_24)or (cde_race_16   = cde_race_25  )or (cde_race_16   = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end
 when  cde_race_17  <> ' ' then
 case when ( (cde_race_17  = cde_race_1) or (cde_race_17  = cde_race_3) or (cde_race_17  = cde_race_4)or (cde_race_17   = cde_race_2)or (cde_race_17   = cde_race_6)
    or (cde_race_17   = cde_race_5) or (cde_race_17   = cde_race_7) or (cde_race_17   = cde_race_8) or (cde_race_17    = cde_race_9 )or (cde_race_17   = cde_race_10)
    or (cde_race_17   = cde_race_11) or (cde_race_17   = cde_race_20) or (cde_race_17   = cde_race_12)or (cde_race_17   = cde_race_13 )or (cde_race_17   = cde_race_14)
    or (cde_race_17   = cde_race_15) or (cde_race_17   = cde_race_16) or (cde_race_17   = cde_race_18)or (cde_race_17   = cde_race_19  )or (cde_race_17  = cde_race_21)
    or (cde_race_17   = cde_race_22) or (cde_race_17   = cde_race_23) or (cde_race_17   = cde_race_24)or (cde_race_17   = cde_race_25  )or (cde_race_17  = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end
 when  cde_race_18  <> ' ' then
 case when ( (cde_race_18  = cde_race_1) or (cde_race_18  = cde_race_3) or (cde_race_18  = cde_race_4)or (cde_race_18   = cde_race_2)or (cde_race_18   = cde_race_6)
    or (cde_race_18   = cde_race_5) or (cde_race_18   = cde_race_7) or (cde_race_18   = cde_race_8) or (cde_race_18    = cde_race_9 )or (cde_race_18   = cde_race_10)
    or (cde_race_18   = cde_race_11) or (cde_race_18  = cde_race_20) or (cde_race_18   = cde_race_12)or (cde_race_18   = cde_race_13 )or (cde_race_18   = cde_race_14)
    or (cde_race_18   = cde_race_15) or (cde_race_18  = cde_race_16) or (cde_race_18   = cde_race_17)or (cde_race_18   = cde_race_19  )or (cde_race_18  = cde_race_21)
    or (cde_race_18   = cde_race_22) or (cde_race_18  = cde_race_23) or (cde_race_18   = cde_race_24)or (cde_race_18   = cde_race_25  )or (cde_race_18  = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end
 when  cde_race_19  <> ' ' then
 case when ( (cde_race_19  = cde_race_1) or (cde_race_19  = cde_race_3) or (cde_race_19  = cde_race_4)or (cde_race_19   = cde_race_2)or (cde_race_19   = cde_race_6)
    or (cde_race_19   = cde_race_5) or (cde_race_19   = cde_race_7) or (cde_race_19   = cde_race_8) or (cde_race_19    = cde_race_9 )or (cde_race_19   = cde_race_10)
    or (cde_race_19   = cde_race_11) or (cde_race_19  = cde_race_20) or (cde_race_19   = cde_race_12)or (cde_race_19   = cde_race_13 )or (cde_race_19   = cde_race_14)
    or (cde_race_19   = cde_race_15) or (cde_race_19  = cde_race_16) or (cde_race_19   = cde_race_17)or (cde_race_19   = cde_race_18  )or (cde_race_19  = cde_race_21)
    or (cde_race_19   = cde_race_22) or (cde_race_19  = cde_race_23) or (cde_race_19   = cde_race_24)or (cde_race_19   = cde_race_25  )or (cde_race_19  = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end
 when  cde_race_20  <> ' ' then
 case when ( (cde_race_20  = cde_race_1) or (cde_race_20  = cde_race_3) or (cde_race_20  = cde_race_4)or (cde_race_20   = cde_race_2)or (cde_race_20   = cde_race_6)
    or (cde_race_20   = cde_race_5) or (cde_race_20   = cde_race_7) or (cde_race_20   = cde_race_8) or (cde_race_20    = cde_race_9 )or (cde_race_20   = cde_race_10)
    or (cde_race_20   = cde_race_11) or (cde_race_20  = cde_race_19) or (cde_race_20  = cde_race_12)or (cde_race_20   = cde_race_13 )or (cde_race_20   = cde_race_14)
    or (cde_race_20   = cde_race_15) or (cde_race_20  = cde_race_16) or (cde_race_20  = cde_race_17)or (cde_race_20   = cde_race_18  )or (cde_race_20  = cde_race_21)
    or (cde_race_20   = cde_race_22) or (cde_race_20  = cde_race_23) or (cde_race_20  = cde_race_24)or (cde_race_20   = cde_race_25  )or (cde_race_20  = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end
 when  cde_race_21  <> ' ' then
 case when ( (cde_race_21  = cde_race_1) or (cde_race_21  = cde_race_3) or (cde_race_21  = cde_race_4)or (cde_race_21   = cde_race_2)or (cde_race_21   = cde_race_6)
    or (cde_race_21   = cde_race_5) or (cde_race_21   = cde_race_7) or (cde_race_21   = cde_race_8) or (cde_race_21    = cde_race_9 )or (cde_race_21   = cde_race_10)
    or (cde_race_21   = cde_race_11) or (cde_race_21  = cde_race_19) or (cde_race_21  = cde_race_12)or (cde_race_21   = cde_race_13 )or (cde_race_21   = cde_race_14)
    or (cde_race_21   = cde_race_15) or (cde_race_21  = cde_race_16) or (cde_race_21  = cde_race_17)or (cde_race_21   = cde_race_18  )or (cde_race_21  = cde_race_20)
    or (cde_race_21   = cde_race_22) or (cde_race_21  = cde_race_23) or (cde_race_21  = cde_race_24)or (cde_race_21   = cde_race_25  )or (cde_race_21  = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end
 when  cde_race_22  <> ' ' then
 case when ( (cde_race_22  = cde_race_1) or (cde_race_22  = cde_race_3) or (cde_race_22  = cde_race_4)or (cde_race_22   = cde_race_2)or (cde_race_22   = cde_race_6)
    or (cde_race_22   = cde_race_5) or (cde_race_22   = cde_race_7) or (cde_race_22   = cde_race_8) or (cde_race_22    = cde_race_9 )or (cde_race_22   = cde_race_10)
    or (cde_race_22   = cde_race_11) or (cde_race_22  = cde_race_19) or (cde_race_22  = cde_race_12)or (cde_race_22   = cde_race_13 )or (cde_race_22   = cde_race_14)
    or (cde_race_22   = cde_race_15) or (cde_race_22  = cde_race_16) or (cde_race_22  = cde_race_17)or (cde_race_22   = cde_race_18  )or (cde_race_22  = cde_race_20)
    or (cde_race_22   = cde_race_21) or (cde_race_22  = cde_race_23) or (cde_race_22  = cde_race_24)or (cde_race_22   = cde_race_25  )or (cde_race_22  = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end
 when  cde_race_23  <> ' ' then
 case when ( (cde_race_23  = cde_race_1) or (cde_race_23  = cde_race_3) or (cde_race_23  = cde_race_4)or (cde_race_23   = cde_race_2)or (cde_race_23   = cde_race_6)
    or (cde_race_23   = cde_race_5) or (cde_race_23   = cde_race_7) or (cde_race_23   = cde_race_8) or (cde_race_23    = cde_race_9 )or (cde_race_23   = cde_race_10)
    or (cde_race_23   = cde_race_11) or (cde_race_23  = cde_race_19) or (cde_race_23  = cde_race_12)or (cde_race_23   = cde_race_13 )or (cde_race_23   = cde_race_14)
    or (cde_race_23   = cde_race_15) or (cde_race_23  = cde_race_16) or (cde_race_23  = cde_race_17)or (cde_race_23   = cde_race_18  )or (cde_race_23  = cde_race_20)
    or (cde_race_23   = cde_race_21) or (cde_race_23  = cde_race_22) or (cde_race_23  = cde_race_24)or (cde_race_23   = cde_race_25  )or (cde_race_23  = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end
 when  cde_race_24  <> ' ' then
 case when ( (cde_race_24  = cde_race_1) or (cde_race_24  = cde_race_3) or (cde_race_24  = cde_race_4)or (cde_race_24   = cde_race_2)or (cde_race_24   = cde_race_6)
    or (cde_race_24   = cde_race_5) or (cde_race_24   = cde_race_7) or (cde_race_24   = cde_race_8) or (cde_race_24    = cde_race_9 )or (cde_race_24   = cde_race_10)
    or (cde_race_24   = cde_race_11) or (cde_race_24  = cde_race_19) or (cde_race_24  = cde_race_12)or (cde_race_24   = cde_race_13 )or (cde_race_24   = cde_race_14)
    or (cde_race_24   = cde_race_15) or (cde_race_24  = cde_race_16) or (cde_race_24  = cde_race_17)or (cde_race_24   = cde_race_18  )or (cde_race_24  = cde_race_20)
    or (cde_race_24   = cde_race_21) or (cde_race_24  = cde_race_22) or (cde_race_24  = cde_race_23)or (cde_race_24   = cde_race_25  )or (cde_race_24  = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end
 when  cde_race_25  <> ' ' then
 case when ( (cde_race_25  = cde_race_1) or (cde_race_25  = cde_race_3) or (cde_race_25  = cde_race_4)or (cde_race_25   = cde_race_2)or (cde_race_25   = cde_race_6)
    or (cde_race_25   = cde_race_5) or (cde_race_25   = cde_race_7) or (cde_race_25   = cde_race_8) or (cde_race_25    = cde_race_9 )or (cde_race_25   = cde_race_10)
    or (cde_race_25   = cde_race_11) or (cde_race_25  = cde_race_19) or (cde_race_25  = cde_race_12)or (cde_race_25   = cde_race_13 )or (cde_race_25   = cde_race_14)
    or (cde_race_25   = cde_race_15) or (cde_race_25  = cde_race_16) or (cde_race_25  = cde_race_17)or (cde_race_25   = cde_race_18  )or (cde_race_25  = cde_race_20)
    or (cde_race_25   = cde_race_21) or (cde_race_25  = cde_race_22) or (cde_race_25  = cde_race_23)or (cde_race_25   = cde_race_24  )or (cde_race_25  = cde_race_26)
    ) then 'duplicate'
      else  'Not dup'
end
 when  cde_race_26  <> ' ' then
 case when ( (cde_race_26  = cde_race_1) or (cde_race_26  = cde_race_3) or (cde_race_26  = cde_race_4)or (cde_race_26   = cde_race_2)or (cde_race_26   = cde_race_6)
    or (cde_race_26   = cde_race_5) or (cde_race_26   = cde_race_7) or (cde_race_26   = cde_race_8) or (cde_race_26    = cde_race_9 )or (cde_race_26   = cde_race_10)
    or (cde_race_26   = cde_race_11) or (cde_race_26  = cde_race_19) or (cde_race_26  = cde_race_12)or (cde_race_26   = cde_race_13 )or (cde_race_26   = cde_race_14)
    or (cde_race_26   = cde_race_15) or (cde_race_26  = cde_race_16) or (cde_race_26  = cde_race_17)or (cde_race_26   = cde_race_18  )or (cde_race_26  = cde_race_20)
    or (cde_race_26   = cde_race_21) or (cde_race_26  = cde_race_22) or (cde_race_26  = cde_race_23)or (cde_race_26   = cde_race_24  )or (cde_race_26  = cde_race_25)
    ) then 'duplicate'
      else  'Not dup'
end

end ) = 'duplicate'
; 

desc t_re_race;

select * from t_cde_race;
-- these records should not have any pre-edits

select 
rc.sak_recip
,m.id_medicaid
,rc.dte_added
,rc.dte_last_update
,rc.cde_source
,mhist.cde_race
,mhist.CDE_RACE_1
,mhist.CDE_RACE_2
,mhist.CDE_RACE_3
,mhist.CDE_RACE_4
,mhist.CDE_RACE_5
,mhist.CDE_RACE_6
,mhist.CDE_RACE_7
,mhist.CDE_RACE_8
,mhist.CDE_RACE_9
,mhist.CDE_RACE_10
,mhist.CDE_RACE_11
,mhist.CDE_RACE_12
,mhist.CDE_RACE_13
,mhist.CDE_RACE_14
,mhist.CDE_RACE_15
,mhist.CDE_RACE_16
,mhist.CDE_RACE_17
,mhist.CDE_RACE_18
,mhist.CDE_RACE_19
,mhist.CDE_RACE_20
,mhist.CDE_RACE_21
,mhist.CDE_RACE_22
,mhist.CDE_RACE_23
,mhist.CDE_RACE_24
,mhist.CDE_RACE_25
,mhist.CDE_RACE_26
,cde_error1
,cde_error2
,cde_error3
,cde_error4
,cde_error5
,cde_error6
,cde_error7
,cde_error8
,cde_error9
,cde_error10
from 
t_re_race rc
,t_re_base m
,t_re_teds_tranhist mhist
where
     m.id_medicaid = mhist.id_medicaid
and  m.sak_recip = rc.sak_recip
and mhist.dte_added = 20230616
and rc.dte_last_update =20230613 
and rc.cde_source = 'TED'
--and rc.dte_Added = 20230613
and cde_error1 = '0000'
--and mhist.sak_tran = ( select max(sak_tran)
--                        from t_re_teds_tranhist tran
--                where tran.id_medicaid = mhist.id_medicaid
--                  and tran.dte_added = 20230613) 
;                  



--dod check

select id_medicaid,m.dte_death,rc.*
from
t_re_base m
, t_re_Race rc
where 
      m.ind_active = 'Y'
    and m.dte_death <> 0
    and m.sak_recip = rc.sak_recip
    and rc.dte_last_update = 20230929
;

--audit
select * from
a_t_re_base
--where id_medicaid = 'TD530136511';
--where trunc(dte_sysdate) = '12-SEP-23';
where sak_recip = 1558432;

--base

select * from t_re_base
--where id_medicaid= 'TD528826257'
where sak_recip = 722648
;


select * from a_t_re_base
--where id_medicaid= 'TD528826257'
where sak_recip = 722648
;

--where id_medicaid ='TD710000013';

select * from t_re_race
where sak_recip  in (6200605);



select * from a_t_re_race
where
sak_recip = 6200605;
--dte_last_update = '20230616'
--and cde_source = 'TED'

select * from  t_re_teds_tranresp
where 
sak_tran = 21135206;

select * from t_re_teds_tranhist_rdemo
where id_medicaid = 'TD713360487'
--where dte_added='20230908';

select * from T_TEDS_ERR_MSG
where 

select * from T_TEDS_recon_ERR_MSG;

--single
select * from t_re_teds_tranhist
where 
--cde_race_11 <> ' '
--dte_added = 20230929;
id_medicaid = 'TD704004080'



select * from t_re_teds_tranhist
where id_medicaid = 'TD208791197'
--and dte_Added = 20230912;
--where cde_Race_11 <> ' ';

select * from t_cde_race;
--and dte_Added = '20230616';


-- hierarchy query

select id_medicaid
,cde_error1
, (select Num_priority as h1
from T_TEDS_RECON_ERR_MSG rerr
where hist.cde_error1 = rerr.cde_error and
hist.cde_error1 <> '0000') as hierarchy1
,cde_error2
, (select Num_priority
from T_TEDS_RECON_ERR_MSG rerr
where hist.cde_error2 = rerr.cde_error and
hist.cde_error2 <> '0000') as hierarchy2
,cde_error3
, (select Num_priority
from T_TEDS_RECON_ERR_MSG rerr
where hist.cde_error3 = rerr.cde_error and
hist.cde_error3 <> '0000') as hierarchy3
,cde_error4
, (select Num_priority
from T_TEDS_RECON_ERR_MSG rerr
where hist.cde_error4 = rerr.cde_error and
hist.cde_error4 <> '0000') as hierarchy4
,cde_error5
, (select Num_priority
from T_TEDS_RECON_ERR_MSG rerr
where hist.cde_error5 = rerr.cde_error and
hist.cde_error5 <> '0000') as hierarchy5
,cde_error6
, (select Num_priority
from T_TEDS_RECON_ERR_MSG rerr
where hist.cde_error6 = rerr.cde_error and
hist.cde_error6 <> '0000') as hierarchy6
,cde_error7
, (select Num_priority
from T_TEDS_RECON_ERR_MSG rerr
where hist.cde_error7 = rerr.cde_error and
hist.cde_error7 <> '0000') as hierarchy7
,cde_error8
, (select Num_priority
from T_TEDS_RECON_ERR_MSG rerr
where hist.cde_error8 = rerr.cde_error and
hist.cde_error8 <> '0000') as hierarchy8
,cde_error9
, (select Num_priority
from T_TEDS_RECON_ERR_MSG rerr
where hist.cde_error9 = rerr.cde_error and
hist.cde_error9 <> '0000') as hierarchy9
,cde_error10
, (select Num_priority
from T_TEDS_RECON_ERR_MSG rerr
where hist.cde_error10 = rerr.cde_error and
hist.cde_error10 <> '0000') as hierarchy10
from
t_re_teds_tranhist_rdemo hist
where   
     hist.dte_added = 20230613
 and ( hist.cde_error1 <> '0000' 
 or hist.cde_error2 <> '0000'
 or hist.cde_error3 <> '0000'
 or hist.cde_error4 <> '0000'
 or hist.cde_error5 <> '0000'
 or hist.cde_error6 <> '0000'
 or hist.cde_error7 <> '0000'
 or hist.cde_error8 <> '0000'
 or hist.cde_error9 <> '0000'
 or hist.cde_error10 <> '0000'
 )
 ;
 
 desc t_re_teds_Tran_elig;

select count(*) from t_re_teds_Tran_elig;


select * from t_teds_recon_err_msg;

 select count(*) from
t_re_teds_tranhist hist
where   
     hist.dte_added = 20230929
     and sak_tran > 25802912;
 
 select* from
t_re_teds_tranhist hist
where   
   --  hist.dte_added = 20230613;
 id_medicaid='TD216758619';

 
 
 -- count of Bypass errors - Inbound

 select count( id_medicaid)
 from t_re_teds_tranhist t
 where txn_status = 'C'
 and dte_Added = 20230929
 and exists 
 (select 1 from
 t_re_teds_tranresp r
 ,t_teds_err_msg m
 where t.sak_tran = r.sak_tran
 and r.cde_Error = m.cde_error
 and m.type_error = 'B'
 and error_Active = 'Y');
 
-- Informational
 select *
 from t_re_teds_tranhist t
 where  txn_status = 'C'
 and dte_Added = 20231002
 and exists 
 (select 1 from
 t_re_teds_tranresp r
 ,t_teds_err_msg m
 where t.sak_tran = r.sak_tran
 and r.cde_Error = m.cde_error
 and m.type_error = 'I'
 and error_Active = 'Y');
 
 --fatal
 select count(*)
 from t_re_teds_tran t
 where tran_error = 'C'
 and dte_Added = 20230613
 and exists 
 (select 1 from
 t_re_teds_tranresp r
 ,t_teds_err_msg m
 where t.sak_tran = r.sak_tran
 and r.cde_Error = m.cde_error
 and m.type_error = 'F'
 and error_Active = 'Y');

--sucessfully processed


 select count(distinct id_medicaid)
 from t_re_teds_tranhist t
 where tran_error = 'C'
 and dte_Added = 20230613
 and not exists 
 (select 1 from
 t_re_teds_tranresp r
 ,t_teds_err_msg m
 where t.sak_tran = r.sak_tran
 and r.cde_Error = m.cde_error
 --and m.type_error = 'F'
 and error_Active = 'Y');
 
 select * from t_teds_err_msg;
 
 -- positive updates , data not matching, use max sak tran 

select 
m.id_medicaid
,rc.cde_race_1
,rc.cde_race_2
,rc.cde_race_3
,rc.cde_race_4
,rc.cde_race_5
,rc.cde_race_6
,rc.cde_race_7
,rc.cde_race_8
,rc.cde_race_9
,rc.cde_race_10
,rc.cde_race_11
,rc.cde_race_12
,rc.cde_race_13
,rc.cde_race_14
,rc.cde_race_15
,rc.cde_race_16
,rc.cde_race_17
,rc.cde_race_18
,rc.cde_race_19
,rc.cde_race_20
,rc.cde_race_21
,rc.cde_race_22
,rc.cde_race_23
,rc.cde_race_24
,rc.cde_race_25
,rc.cde_race_26
from t_re_race rc
  ,t_re_base m
   ,t_re_teds_tran tran
where 
    m.id_medicaid = tran.id_medicaid 
--and m.id_medicaid = 'TD288786239'    
and m.sak_recip = rc.sak_recip
and tran.tran_error = 'C'
and tran.dte_added = 20230613
and rc.dte_last_update = 20230613 
and (rc.cde_race_1 <> tran.cde_race_1
or rc.cde_race_2 <> tran.cde_race_2
or rc.cde_race_3 <> tran.cde_race_3
or rc.cde_race_4 <> tran.cde_race_4
or rc.cde_race_5 <> tran.cde_race_5
or rc.cde_race_6 <> tran.cde_race_6
or rc.cde_race_7 <> tran.cde_race_7
or rc.cde_race_8 <> tran.cde_race_8
or rc.cde_race_9 <> tran.cde_race_9
or rc.cde_race_10 <> tran.cde_race_10
or rc.cde_race_11 <> tran.cde_race_11
or rc.cde_race_12 <> tran.cde_race_12
or rc.cde_race_13 <> tran.cde_race_13
or rc.cde_race_14 <> tran.cde_race_14
or rc.cde_race_15 <> tran.cde_race_15
or rc.cde_race_16 <> tran.cde_race_16
or rc.cde_race_17 <> tran.cde_race_17
or rc.cde_race_18 <> tran.cde_race_18
or rc.cde_race_19 <> tran.cde_race_19
or rc.cde_race_20 <> tran.cde_race_20
or rc.cde_race_21 <> tran.cde_race_21
or rc.cde_race_22 <> tran.cde_race_22
or rc.cde_race_23 <> tran.cde_race_23
or rc.cde_race_24 <> tran.cde_race_24
or rc.cde_race_25 <> tran.cde_race_25
or rc.cde_race_26 <> tran.cde_race_26
)
and exists ( select 1 from t_re_teds_tranhist hist
where
hist.id_medicaid = tran.id_medicaid
and hist.sak_tran = tran.sak_tran
and hist.dte_Added = tran.dte_Added
and ( cde_error1 = '0000'
and cde_error2 = '0000'
and cde_error3 = '0000'
and cde_error4 = '0000'
and cde_error5 = '0000'
and cde_error6 = '0000'
and cde_error7 = '0000'
and cde_error8 = '0000'
and cde_error9 = '0000'
and cde_error10 = '0000'
)
)
;
 
desc t_re_race;

desc  t_re_teds_tranresp;


select * from t_re_teds_tranhist_rdemo
where id_medicaid='TD714423124';
--where dte_added = 20230912;


select * from t_re_teds_tranhist
where id_medicaid='TD713374473'
--and dte_added = 20230908;
--where cde_race_5 <> ' ';

select * from t_teds_err_msg;

--updates each day

select * from t_re_race
where dte_last_update = 20231002;
--where dte_added= 20230616;
where sak_Recip = 288114;

select * from a_t_re_race
where sak_recip = 7238538;

select * from t_cde_race;
-- write qc queries to catch Indv where the 6301 invalid combinations are present

SELECT   T1.DTE_ADDED,
         E.TYPE_ERROR,
         T1.ERR,
         TRIM(E.DSC_ERROR) DESCRIPT,
         T1.CNT
FROM    (SELECT    A.DTE_ADDED,
                   A.ERR, 
             count(*) as CNT
          FROM     (SELECT    01 AS ERRSEQ,
                    H.DTE_ADDED,
                    H.sak_tran,
                    H.CDE_ERROR1 AS ERR
         FROM      T_RE_TEDS_TRANHIST  H
         WHERE    ( H.CDE_ERROR1 <> '0000'
                   or H.CDE_ERROR2 <> '0000'
                   or H.CDE_ERROR3 <> '0000'
                   or H.CDE_ERROR4 <> '0000'
                   or H.CDE_ERROR5 <> '0000'
                   or  H.CDE_ERROR6 <> '0000'
                   )         
                 )  A

        where    A.dte_added  = 20231004  -- add cycle date
         group by A.DTE_ADDED,
                  A.err) T1,
                  T_TEDS_ERR_MSG E
WHERE    T1.ERR = E.CDE_ERROR
order BY 1,2,3;     


-- error check

 select 
 distinct hist.id_medicaid
--count(distinct hist.id_medicaid)
,cde_race
,CDE_RACE_1
,CDE_RACE_2
,CDE_RACE_3
,CDE_RACE_4
,CDE_RACE_5
,CDE_RACE_6
,CDE_RACE_7
,CDE_RACE_8
,CDE_RACE_9
,CDE_RACE_10
,CDE_RACE_11
,CDE_RACE_12
,CDE_RACE_13
,CDE_RACE_14
,CDE_RACE_15
,CDE_RACE_16
,CDE_RACE_17
,CDE_RACE_18
,CDE_RACE_19
,CDE_RACE_20
,CDE_RACE_21
,CDE_RACE_22
,CDE_RACE_23
,CDE_RACE_24
,CDE_RACE_25
,CDE_RACE_26
,cde_error1
,cde_error2
,cde_error3
,cde_error4
,cde_error5
,cde_error6
,cde_error7
,cde_error8
,cde_error9
,cde_error10
from 
 t_re_teds_tranhist_rdemo hist
where
    -- hist.dte_Added = 20230912
    --and
    ( cde_error1 ='R0030' or cde_error2 ='R0030' or cde_error3 ='R0030')
     and (( cde_race_4 <> ' ' or cde_race_3 <> ' '))
and ( ( cde_error1 in   
              (select cde_error from t_teds_recon_err_msg e
            where type_error = 'I' 
              ) )
or ( cde_error1 ='00000')
);



select * from T_TEDS_ERR_MSG;

desc t_re_base;

--finding the count of the recipient that had changes to a specific column
create table teds_recon100623_email_chgs as (
SELECT b.id_medicaid,ba.sak_recip, b.email as curr_email, ba.email as audit_email, b.dte_last_update as b_last_update ,ba.Dte_Sysdate as audit_sysdate   
 FROM T_RE_BASE B,
 A_T_RE_BASE BA 
WHERE B.SAK_RECIP = BA.SAK_RECIP 
AND TO_CHAR(BA.DTE_SYSDATE, 'YYYYMMDD HH24MISS') >=  '20231007 143500' 
AND TO_CHAR(BA.DTE_SYSDATE, 'YYYYMMDD HH24MISS') <=  '20231007 151700' 
AND B.DTE_LAST_UPDATE = 20231006
AND BA.CDE_ACTION = 'U' 
AND B.CDE_SOURCE = 'TDR' -- TDR for Recon
AND  BA.EMAIL IS NOT NULL
)
; -- change the column name accordingly 

select count(*) from TEDS_RECON100623_EMAIL_CHGS;

-- looking for Email updates that Recon made which previously had updates from Daily

select b.id_medicaid,ba.sak_recip, b.email, ba.email, b.dte_last_update,ba.Dte_Sysdate 
  from t_re_base b,
       a_t_re_base ba
Where B.Sak_Recip = Ba.Sak_Recip
And To_Char(Ba.Dte_Sysdate, 'YYYYMMDD HH24MISS') >='20231006  000000'
and ba.cde_action = 'U'
and b.cde_source = 'TDR'
and ( ba.EMAIL is not null and ba.EMAIL <> ' ')
and exists
(select 1 from 		
(select pba.*,row_number() over (partition by pba.sak_recip order by pba.dte_sysdate desc) row_num
	from  a_t_re_base pba
Where pba.Sak_Recip = Ba.Sak_Recip
	And To_Char(pBa.Dte_Sysdate, 'YYYYMMDD HH24MISS') <='20231006  000000'
	 )
where row_num = 1
and  ( EMAIL is not null and EMAIL <> ' ')
)
order by b.id_medicaid;


select * from a_t_re_base
where sak_recip = 2380
;

-- row num function
select * from 		
(select pba.*,row_number() over (partition by pba.sak_recip order by pba.dte_sysdate desc) row_num
	from  a_t_re_base pba
Where pba.Sak_Recip = 7258449
	And To_Char(pBa.Dte_Sysdate, 'YYYYMMDD HH24MISS') <='20231006  000000'
	 )
where row_num = 1
and  (EMAIL is not null and EMAIL <> ' ')
;

select * from t_re_base
--where sak_recip = 7256274
where id_medicaid = 'TD532949093'


;


-- looking for phone # updates
create table teds_recon100623_phone_chgs as (
select b.id_medicaid,ba.sak_recip, b.NUM_PHONE as curr_phone, ba.NUM_PHONE as audit_phone, b.dte_last_update as b_last_update,ba.Dte_Sysdate as audit_sysdate
  from t_re_base b,
       a_t_re_base ba
Where B.Sak_Recip = Ba.Sak_Recip
AND TO_CHAR(BA.DTE_SYSDATE, 'YYYYMMDD HH24MISS') >=  '20231007 143500' 
AND TO_CHAR(BA.DTE_SYSDATE, 'YYYYMMDD HH24MISS') <=  '20231007 151700' 
and ba.cde_action = 'U'
and b.cde_source = 'TDR'
AND B.DTE_LAST_UPDATE = 20231006
and ( ba.NUM_PHONE is not null) --and ba.NUM_PHONE <> ' ')
);

and exists
(select 1 from 		
(select pba.*,row_number() over (partition by pba.sak_recip order by pba.dte_sysdate desc) row_num
	from  a_t_re_base pba
Where pba.Sak_Recip = Ba.Sak_Recip
	And To_Char(pBa.Dte_Sysdate, 'YYYYMMDD HH24MISS') <='20231006  000000'
	 )
where row_num = 1
and  ( NUM_PHONE is not null and NUM_PHONE <> ' ')
)
order by b.id_medicaid;


select * from t_cde_race;

select count(*) from TEDS_RECON100623_PHONE_CHGS;

--finding the count of the recipient that had changes to a specific column
