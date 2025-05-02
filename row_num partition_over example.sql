(select 1 from  
 ( select audtelig.*,row_number() over (partition by audtelig.sak_recip order by audtelig.dte_sysdate desc) row_num
    from 
      a_T_RE_ELIG audtelig
   where 
     audtelig.SAK_RECIP = 5259478
	 )
	 where row_num = 1
	  and dte_end = 22991231
	 )