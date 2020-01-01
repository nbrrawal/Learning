/*  
Sample codes to understand 
inner join
left join
right join 
full join
cartesian join
*/

data table_a; 
input id emp_name $; 
datalines; 
1 a 
2 b 
3 c 
4 d 
5 e
6 f
; 
run; 
 
data table_b; 
input id emp_salary; 
datalines; 
1 1300 
2 1500 
3 2000 
4 1300
5 1400
7 1500 
;
run; 
/*inner join example
All records present in both tables will be returned 
6th and 7th id record is not present in other tables.
*/
proc sql; 
create table inner_join as 
select 
	a.id as a_id 
, 	a.emp_name
, 	b.id as b_id 
, 	b.emp_salary 
from table_a a 
inner join  
table_b b 
on 
a.id = b.id; 
quit; 

/*Left join example  
All records in left table will be returned 
6th id record is not present in table b so 
its salary will be missing but id and 
emp_name will be present
*/
proc sql; 
create table left_join as 
select 
	a.id as a_id 
, 	a.emp_name
,	b.id as b_id
, 	b.emp_salary 
from table_a a 
left join  
table_b b 
on 
a.id = b.id; 
quit; 
/*Right join example  
All records in right table will be returned 
7th id record is not present in table so 
its salary will be missing
*/
proc sql; 
create table right_join as 
select 
	a.id as a_id 
, 	a.emp_name
, 	b.id as b_id 
, 	b.emp_salary 
from table_a a 
right join  
table_b b 
on 
a.id = b.id; 
quit; 
/*Right join example  
All records in right table will be returned 
7th id record is not present in table so 
its salary will be missing
*/
proc sql; 
create table full_join as 
select 
	a.id as a_id 
, 	a.emp_name
, 	b.id as b_id 
, 	b.emp_salary 
from table_a a 
full join  
table_b b 
on 
a.id = b.id; 
quit; 
/* catersian join example: 
all records in table a will be join with all records in table b 
lets say 
tablea contains m records 
tableb contains n records, 
output will be m x n records 
 */
proc sql;                  
  create table cart_join as    
    select 
 	a.id as a_id 
, 	a.emp_name
, 	b.id as b_id 
, 	b.emp_salary      
                           
    from table_a  a             
        ,table_b b;              
quit;     
