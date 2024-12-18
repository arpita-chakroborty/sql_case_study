use bike_sales
select * from addresses;
select * from auto_repair;
select * from businesspartners;
-- product analysis
-- 1.list the top 5 most expensive products;
select * from products
order by price desc
limit 5;

-- 2.find all products that belong to the 'mountain bike' category.
select * from productcategorytext;
select p.productid,pc.PRODCATEGORYID  from products p
left join productcategorytext pc 
on p.PRODCATEGORYID= pc.PRODCATEGORYID
where SHORT_DESCR = 'Mountain Bike';
-- 3.find the total sales amount (gross) for each product category
select p.productid, sum(grossamount) as total_gorss from products p 
left join salesorderitems s 
on p.PRODUCTID= s.PRODUCTID
group by p.productid;
-- 4.find the total number of products for each category
select PRODCATEGORYID,count(*) as total_count
from products
group by PRODCATEGORYID;
-- 5. List the top 5 suppliers by total product sales.
select p.PRODUCTID ,s.PARTNERID ,sum(price) as total from products p 
left join salesorders s 
on p.SUPPLIER_PARTNERID= s.PARTNERID
group by  p.PRODUCTID ,s.PARTNERID
order by total desc
limit 5;
-- 6 Find the total number of products created by each employee
select CREATEDBY,count(PRODUCTID) as no_of_product from products p 
left join  employees e 
on e.EMPLOYEEID= p.CREATEDBY
group by CREATEDBY
order by CREATEDBY;
-- 7: List the employees who have changed product details the most
select CHANGEDBY,count(PRODUCTID) as no_of_product from products p 
left join  employees e 
on e.EMPLOYEEID= p.CHANGEDBY
group by CHANGEDBY
order by CHANGEDBY desc;
 -- Q8: Calculate the total gross amount for each sales order.
 select SALESORDERID, sum(GROSSAMOUNT) as total 
 from salesorders
 group by SALESORDERID
 order by  total  desc;
  -- Q9: Trend in sales over different fiscal year periods
  select  year(fiscalyearperiod) as year,sum(netamount) as total
  from salesorders
  group by  year(fiscalyearperiod);
  -- 10 Which products contribute the most to revenue when the billing status is 'Complete'
 select p.productid,s.BILLINGSTATUS ,sum(grossamount) as total_revenue from salesorders s 
 left join products p 
 on s.PARTNERID= p.SUPPLIER_PARTNERID
 -- where s.BILLINGSTATUS= 'c'
 group by p.productid,s.BILLINGSTATUS
 having s.BILLINGSTATUS = 'c';
 -- Q11: Find the sales order items for a specific product ID.
 select distinct si.productid , si.SALESORDERITEM from salesorderitems si 
 left join  salesorders s 
 on si.SALESORDERID= s.SALESORDERID;