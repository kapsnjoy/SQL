Buy-in query: original

select h.*, ma.dte_effective, ma.dte_end, mb.dte_effective, mb.dte_end, d.BENE_PART_A_ENTL_STRT_DTE_1, d.BENE_PART_A_ENTL_END_DTE_1, d.bene_part_b_ENRL_strt_dte_1, d.bene_part_b_ENRL_end_dte_1
        from dcv3039.BUYIN_ALL h
         inner join t_re_medicare_a ma
            on ma.sak_recip = h.sak_recip
         inner join t_re_medicare_b mb
            on ma.sak_recip = h.sak_recip
           inner join t_re_mma_response_det d
           on d.sak_recip = h.sak_recip
		   
		   
to get max:
and ma.dte_end =(select max(ma1.dte_end)
                                 from t_re_medicare_a ma1
                                 where ma1.sak_recip = ma.sak_recip)
    and mb.dte_end =(select max(mb1.dte_end)
                                 from t_re_medicare_b mb1
                                 where mb1.sak_recip = mb.sak_recip);

MMA columns:
BENE_PART_A_ENTL_STRT_DTE_1	
BENE_PART_A_ENTL_END_DTE_1

BENE_PART_B_ENRL_STRT_DTE_1 
BENE_PART_B_ENRL_END_DTE_1  

BENE_PARTD_PBP_ENRL_STRT_DTE1
BENE_PARTD_PBP_ENRL_END_DTE1

criteria: take the latest Elig Month/year row:
DTE_ELIG = 062024 



select h.*
, ma.dte_effective
, ma.dte_end
, mb.dte_effective
, mb.dte_end
, d.BENE_PART_A_ENTL_STRT_DTE_1
, d.BENE_PART_A_ENTL_END_DTE_1
, d.bene_part_b_ENRL_strt_dte_1
, d.bene_part_b_ENRL_end_dte_1
   from dcv3039.BUYIN_ALL h
      , t_re_medicare_a ma
      , t_re_medicare_b mb
       , t_re_mma_response_det d
where h.id_medicaid = 'TD524824828'
 and ma.sak_recip = h.sak_recip
 and mb.sak_recip = h.sak_recip
 and d.sak_recip = h.sak_recip
 and  ma.dte_end =(select max(ma1.dte_end)
                                 from t_re_medicare_a ma1
                                 where ma1.sak_recip = ma.sak_recip)
and mb.dte_end =(select max(mb1.dte_end)
                                 from t_re_medicare_b mb1
                                 where mb1.sak_recip = mb.sak_recip);
								 
								 
revised:

select distinct h.*
        , ma.dte_effective   -- medicare part A eff-dt
        , ma.dte_end         -- medicare part A end-dt
        , mb.dte_effective   -- medicare part B eff-dt
        , mb.dte_end         -- medicare part B end-dt
        , d.BENE_PART_A_ENTL_STRT_DTE_1   -- mma Part A Entitlement Start Date
        , d.BENE_PART_A_ENTL_END_DTE_1    -- mma Part A Entitlement end Date
        , d.bene_part_b_ENRL_strt_dte_1  -- mma Part B Entitlement Start Date
        , d.bene_part_b_ENRL_end_dte_1   -- mma Part B Entitlement end Date
        ,d.PART_C_ORG_NAM                -- beneficiary's Group Health Organization contract number
        ,d.PART_C_PLAN_NAM              -- beneficiary's plan benefit package
        ,d.BENE_PARTD_PBP_ENRL_STRT_DTE1 --Part D PBP enrollment start-dt
        ,d.BENE_PARTD_PBP_ENRL_END_DTE1  --Part D PBP enrollment end-dt
  from dcv3039.BUYIN_ALL h
         inner join t_re_medicare_a ma
            on ma.sak_recip = h.sak_recip
         inner join t_re_medicare_b mb
            on mb.sak_recip = h.sak_recip
           inner join t_re_mma_response_det d
           on d.sak_recip = h.sak_recip
where h.id_medicaid = 'TD524824828'
and  ma.dte_end =(select max(ma1.dte_end)
                                 from t_re_medicare_a ma1
                                 where ma1.sak_recip = ma.sak_recip)
and mb.dte_end =(select max(mb1.dte_end)
                                 from t_re_medicare_b mb1
                                 where mb1.sak_recip = mb.sak_recip)
and d.DTE_ELIG = '062024'
;

--working version
select distinct h.*
        , ma.dte_effective   -- medicare part A eff-dt
        , ma.dte_end         -- medicare part A end-dt
        , mb.dte_effective   -- medicare part B eff-dt
        , mb.dte_end         -- medicare part B end-dt
        , d.BENE_PART_A_ENTL_STRT_DTE_1   -- mma Part A Entitlement Start Date
        , d.BENE_PART_A_ENTL_END_DTE_1    -- mma Part A Entitlement end Date
        , d.bene_part_b_ENRL_strt_dte_1  -- mma Part B Entitlement Start Date
        , d.bene_part_b_ENRL_end_dte_1   -- mma Part B Entitlement end Date
   from dcv3039.BUYIN_ALL h
         right join t_re_medicare_a ma
            on ma.sak_recip = h.sak_recip
         right join t_re_medicare_b mb
            on mb.sak_recip = h.sak_recip
          right join t_re_mma_response_det d
           on d.sak_recip = h.sak_recip
where 
     h.id_medicaid = 'TD524824828'
  and  (ma.dte_end =(select max(ma1.dte_end)
                                 from t_re_medicare_a ma1
                                 where ma1.sak_recip = ma.sak_recip)
  and mb.dte_end =(select max(mb1.dte_end)
                                 from t_re_medicare_b mb1
                                 where mb1.sak_recip = mb.sak_recip)
                              )   
 and d.DTE_ELIG =  ( select max(substr(m.dte_elig,1,2))||max(substr(m.dte_elig,3,4))
                        from t_re_mma_extract_det m
                    where m.sak_recip = h.sak_recip
                      and substr(m.dte_elig,3,4) = (
                            select max(substr(mx.dte_elig,3,4)) 
                            from t_re_mma_extract_det mx
                            where mx.sak_recip = m.sak_recip
                            )
                    )   
;


--testing queries

select distinct h.*
		, buyb.CDE_BUY_TXN   -- buyin_txn
		, buyb.CDE_BUY_MODI   -- buyin_MODI
    from dcv3039.BUYINA_ALL h
  left outer join (select * from T_BUYB_BILL buyb
                        where buyb.DTE_BUY_PROC =(select max(buyb1.DTE_BUY_PROC)
                                 from T_BUYB_BILL buyb1
                                 where buyb1.sak_recip = buyb.sak_recip) 
								 ) buyb
                    	 on buyb.sak_recip = h.sak_recip
     where h.id_medicaid = 'TD525553115'
     
     
     select * from T_BUYB_BILL buyb
        where buyb.DTE_BUY_PROC =(select max(buyb1.DTE_BUY_PROC)
                                from T_BUYB_BILL buyb1
                                where buyb1.sak_recip = buyb.sak_recip
                 ) 
          and buyb.sak_recip = 663524
     
     
     
     select * from T_BUYA_BILL buya
        where buya.DTE_BUY_PROC =(select max(buya1.DTE_BUY_PROC)
                                from T_BUYA_BILL buya1
                                where buya1.sak_recip = buya.sak_recip
                 ) 
          and buya.sak_recip = 663524


 updated-- outer join
select distinct h.*
        , ma.dte_effective   -- medicare part A eff-dt
        , ma.dte_end         -- medicare part A end-dt
        , mb.dte_effective   -- medicare part B eff-dt
        , mb.dte_end         -- medicare part B end-dt
        , d.BENE_PART_A_ENTL_STRT_DTE_1   -- mma Part A Entitlement Start Date
        , d.BENE_PART_A_ENTL_END_DTE_1    -- mma Part A Entitlement end Date
        , d.bene_part_b_ENRL_strt_dte_1  -- mma Part B Entitlement Start Date
        , d.bene_part_b_ENRL_end_dte_1   -- mma Part B Entitlement end Date
   from dcv3039.BUYIN_ALL h
         left outer join ( select * from 
                         t_re_medicare_a ma
                     where  ma.dte_end =(select max(ma1.dte_end)
                                 from t_re_medicare_a ma1
                                 where ma1.sak_recip = ma.sak_recip) 
                            ) ma 
                   on ma.sak_recip = h.sak_recip
         left outer join ( select * from t_re_medicare_b mb
                        where mb.dte_end =(select max(mb1.dte_end)
                                 from t_re_medicare_b mb1
                                 where mb1.sak_recip = mb.sak_recip) 
								 ) mb
                    on mb.sak_recip = h.sak_recip    
           left outer join ( select * from t_re_mma_response_det d
                               where d.DTE_ELIG =  ( select max(substr(m.dte_elig,1,2))||max(substr(m.dte_elig,3,4))
                                                  from t_re_mma_extract_det m
                                                        where m.sak_recip = d.sak_recip
                                                          and substr(m.dte_elig,3,4) = (
                                                                select max(substr(mx.dte_elig,3,4)) 
                                                                from t_re_mma_extract_det mx
                                                                where mx.sak_recip = m.sak_recip
                                                                )
                                                        ) 
                                                    ) d
                         on d.sak_recip = h.sak_recip
  ;
  
  
  
  -- new changes, cde_buy_txn, cde_buy_modI (part A)
 -- Use max(dte_buy_proc),pull - cde_buy_txn, cde_buy_modI from buyb and buya

-- Nancy's tables dcv.Buyina_all, dcv.Buyinb_all
 
  
  select distinct h.*
        , ma.dte_effective   -- medicare part A eff-dt
        , ma.dte_end         -- medicare part A end-dt
        , mb.dte_effective   -- medicare part B eff-dt
        , mb.dte_end         -- medicare part B end-dt
		, buyb.CDE_BUY_TXN   -- buyin_txn
		, buyb.CDE_BUY_MODI   -- buyin_MODI
        , d.BENE_PART_A_ENTL_STRT_DTE_1   -- mma Part A Entitlement Start Date
        , d.BENE_PART_A_ENTL_END_DTE_1    -- mma Part A Entitlement end Date
        , d.bene_part_b_ENRL_strt_dte_1  -- mma Part B Entitlement Start Date
        , d.bene_part_b_ENRL_end_dte_1   -- mma Part B Entitlement end Date
   from dcv3039.BUYINA_ALL h
         left outer join ( select * from 
                         t_re_medicare_a ma
                     where  ma.dte_end =(select max(ma1.dte_end)
                                 from t_re_medicare_a ma1
                                 where ma1.sak_recip = ma.sak_recip) 
                            ) ma 
                   on ma.sak_recip = h.sak_recip
         left outer join ( select * from t_re_medicare_b mb
                        where mb.dte_end =(select max(mb1.dte_end)
                                 from t_re_medicare_b mb1
                                 where mb1.sak_recip = mb.sak_recip) 
								 ) mb
                    on mb.sak_recip = h.sak_recip    
           left outer join ( select * from t_re_mma_response_det d
                               where d.DTE_ELIG =  ( select max(substr(m.dte_elig,1,2))||max(substr(m.dte_elig,3,4))
                                                  from t_re_mma_extract_det m
                                                        where m.sak_recip = d.sak_recip
                                                          and substr(m.dte_elig,3,4) = (
                                                                select max(substr(mx.dte_elig,3,4)) 
                                                                from t_re_mma_extract_det mx
                                                                where mx.sak_recip = m.sak_recip
                                                                )
                                                        ) 
                                                    ) d
                         on d.sak_recip = h.sak_recip
						 
			left outer join (select * from T_BUYB_BILL buyb
                        where buyb.DTE_BUY_PROC =(select max(buyb.DTE_BUY_PROC)
                                 from T_BUYB_BILL buyb1
                                 where buyb1.sak_recip = buyb.sak_recip) 
								 ) buyb
			 on buyb.sak_recip = h.sak_recip
	where h.id_medicaid = 'TD525553115'
  		 
  ;
     
  -- new changes, cde_buy_txn, cde_buy_modI (part B)
  
  select distinct h.*
        , ma.dte_effective   -- medicare part A eff-dt
        , ma.dte_end         -- medicare part A end-dt
        , mb.dte_effective   -- medicare part B eff-dt
        , mb.dte_end         -- medicare part B end-dt
		, buyb.CDE_BUY_TXN   -- buyin_txn
		, buyb.CDE_BUY_MODI   -- buyin_MODI
        , d.BENE_PART_A_ENTL_STRT_DTE_1   -- mma Part A Entitlement Start Date
        , d.BENE_PART_A_ENTL_END_DTE_1    -- mma Part A Entitlement end Date
        , d.bene_part_b_ENRL_strt_dte_1  -- mma Part B Entitlement Start Date
        , d.bene_part_b_ENRL_end_dte_1   -- mma Part B Entitlement end Date
   from dcv3039.BUYINB_ALL h
         left outer join ( select * from 
                         t_re_medicare_a ma
                     where  ma.dte_end =(select max(ma1.dte_end)
                                 from t_re_medicare_a ma1
                                 where ma1.sak_recip = ma.sak_recip) 
                            ) ma 
                   on ma.sak_recip = h.sak_recip
         left outer join ( select * from t_re_medicare_b mb
                        where mb.dte_end =(select max(mb1.dte_end)
                                 from t_re_medicare_b mb1
                                 where mb1.sak_recip = mb.sak_recip) 
								 ) mb
                    on mb.sak_recip = h.sak_recip    
           left outer join ( select * from t_re_mma_response_det d
                               where d.DTE_ELIG =  ( select max(substr(m.dte_elig,1,2))||max(substr(m.dte_elig,3,4))
                                                  from t_re_mma_extract_det m
                                                        where m.sak_recip = d.sak_recip
                                                          and substr(m.dte_elig,3,4) = (
                                                                select max(substr(mx.dte_elig,3,4)) 
                                                                from t_re_mma_extract_det mx
                                                                where mx.sak_recip = m.sak_recip
                                                                )
                                                        ) 
                                                    ) d
                         on d.sak_recip = h.sak_recip
						 
			left outer join (select * from T_BUYB_BILL buyb
                        where buyb.DTE_BUY_PROC =(select max(buyb.DTE_BUY_PROC)
                                 from T_BUYB_BILL buyb1
                                 where buyb1.sak_recip = buyb.sak_recip) 
								 ) buyb
			 on buyb.sak_recip = h.sak_recip
	where h.id_medicaid = 'TD525553115'
  		 
  ;
  
