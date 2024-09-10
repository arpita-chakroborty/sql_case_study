use mysql_casestudy;
-- 1.show all the columns and rows in the data table 
select  * from salaries;

-- 2. show only the employee name and job_title column.
select employeename,jobtitle from salaries;

-- 3.show the number of employees in the table.
select count(*) as total_no_of_employee from  salaries;

-- 4.show the unique job titles in the table
select distinct jobtitle from salaries;

/*5. show the job title and overtime pay for all employees with overtime 
pay greater than 50000*/
select jobtitle,overtimepay
from salaries
where overtimepay > 50000;

-- 6. show the average base pay for all employees.
select avg(basepay) as avg_pay
from salaries;
-- 7.show the top 10 highest paid employees.
select employeename,totalpay
from salaries
order by totalpay desc
limit 10;
-- 8. show the average of basepay,overtimepay and otherpay for each employee;
select employeename,cast((basepay+overtimepay+otherpay)/3 as decimal(10,2) )as avg_op_bp_otp
from salaries;
-- 9.show all employees who have word 'manager' in their job title.
select employeename, jobtitle
from salaries
where jobtitle like '%manager%';
-- 10. show all employees with a jobtitle without word manager
select employeename, jobtitle
from salaries
where jobtitle <> 'manager';
-- 11. show all employees with a totalpay between 50000 and 75000
select *
from salaries
where totalpay between 50000   and 75000;
-- 12. show all employees with a basepay less than 50000 or a totalpay greater than 100,000
select *
from salaries
where basepay < 50000 or totalpay > 100000;
-- 13.show all employees with a totalpay benifits value between 125,000 and 150,000 and a jobtitle containnig a word 'director'
select * from salaries
where totalpaybenefits between 120000 and 150000 and jobtitle like '%director%';
-- 14.show all employees order by their totalpay benefits in decending order
select * from salaries 
order by totalpaybenefits desc;
-- 15. show all job titles with an average basepay of atleast 100000 and order them by the average basepay in decending order
select jobtitle ,avg_basepay from ( select jobtitle, avg(basepay) as avg_basepay
from salaries
group by jobtitle,basepay
)x
where avg_basepay >=100000
 order by avg_basepay desc;
 -- 16.delete the column 
 alter table salaries
 drop column status;
 select * from salaries;
 /*17.update the basepay of all employees with the jobtitle
 containing 'manager' by incresing it by 10% */
 update salaries
 set basepay=basepay*1.1
 where jobtitle like '%manager%';
 SET SQL_SAFE_UPDATES = 0;
 -- 18. delete all employees who have no basepay
 select count(*) from salaries
 where basepay = 0;
 delete from salaries
 where basepay=0;
 