data temp; 
format  rqo_tran_date date9. ;
input aqo_acct_num $ rqo_tran_date date9.  img_score; 
datalines;
a001 03jan2020 404
a001 05jan2020 233
a001 07jan2020 676
a001 02feb2020 245
a001 03feb2020 565
a001 05feb2020 456
a001 08feb2020 765
a001 09feb2020 676
a001 10feb2020 874
a001 12feb2020 256
a001 13feb2020 874
a001 20feb2020 345
a001 21feb2020 454
a001 21feb2020 487
a001 22feb2020 765
a001 23feb2020 334

; 
run ;
proc sort data= temp; by descending rqo_tran_date; run; 
/*last 3 image scores excluding first 2 days  
_a_chk_today_dt - today
_a_chk_lastday1_dt - yesterday 
_a_chk_lastday2_dt - day before yesterday 
*/
data udv_chk_image_score;
retain _a_chk_today_dt _a_chk_lastday1_dt _a_chk_lastday2_dt;
set temp; 
/* initialize */
if _n_ = 1 then 
do; 

end;
else do;

end; 

run; 
