
proc corr data=sashelp.iris;
run;

proc corr data=sashelp.iris plots=matrix(histogram);
run;

PROC SQL;
create table CARS1 as
SELECT make,type,horsepower,cylinders,weight
FROM
SASHELP.CARS
WHERE make in ('Audi','BMW')
;
RUN;
PROC MEANS DATA=CARS1 STD;
Run;

PROC SURVEYMEANS DATA=CARS1 STD;
Class type;
Var type horsepower;
ods output statistics=rectangle;
Run;
PROC PRINT DATA=rectangle;
Run;
