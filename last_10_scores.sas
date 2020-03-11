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


data udv_chk_image_score;
retain _a_chk_imgscr1-_a_chk_imgscr10;
set temp; 
if _n_ = 1 then 
do; 
_a_chk_imgscr1 =img_score; 
_a_chk_imgscr2 =0; _a_chk_imgscr3 =0; 
_a_chk_imgscr4 =0; _a_chk_imgscr5 =0; 
_a_chk_imgscr6 =0; _a_chk_imgscr7 =0; 
_a_chk_imgscr8 =0; _a_chk_imgscr9 =0; 
_a_chk_imgscr10=0; 
end;
else do;
_a_chk_imgscr10=_a_chk_imgscr9;_a_chk_imgscr9=_a_chk_imgscr8;
_a_chk_imgscr8=_a_chk_imgscr7;_a_chk_imgscr7=_a_chk_imgscr6;
_a_chk_imgscr6=_a_chk_imgscr5;_a_chk_imgscr5=_a_chk_imgscr4;
_a_chk_imgscr4=_a_chk_imgscr3;_a_chk_imgscr3=_a_chk_imgscr2;
_a_chk_imgscr2=_a_chk_imgscr1;_a_chk_imgscr1= img_score;
end; 


_a_chk_avg_last30_imgscore = sum(	_a_chk_imgscr1, _a_chk_imgscr2, 
									_a_chk_imgscr3,_a_chk_imgscr4,
									_a_chk_imgscr5,_a_chk_imgscr6,
									_a_chk_imgscr7,_a_chk_imgscr8,
									_a_chk_imgscr9,_a_chk_imgscr10 
									)/10;



run; 
