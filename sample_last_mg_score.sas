data temp; 
format  rqo_tran_date date9. ;
input aqo_acct_num $ rqo_tran_date date9.  img_score; 
datalines;
a001 03jan2020 404
a001 22jan2020 233
a001 28jan2020 676
a001 03feb2020 343
a001 12mar2020 566
; 
run ;


data udv_chk_image_score;
retain _a_chk_image_score_prev; 
set temp; 
if _n_ = 1 then do;
_a_chk_image_score_prev =0 ;
end;

_a_chk_last_img_score = _a_chk_image_score_prev; 

_a_chk_image_score_prev =img_score;  

run; 
