use dummy;
-- Find the total number of orders per customer (customerNumber, count of orders).
select customernumber, count(ordernumber) as ordercount 
from customers inner join orders using(customernumber) group by customernumber;

-- List all products along with their productLine name (join products and productlines).
select productname , productline from products inner join productlines using(productline);

-- Find customers who have never placed an order (use a LEFT JOIN or NOT IN).
select customernumber,customername from customers left join orders using(customernumber)
where ordernumber is null ;
select customernumber,customername from customers where 
customernumber not in (select customernumber from orders);

-- Get the total sales amount (quantityOrdered * priceEach) per order.
select *,(quantityordered*priceeach)as TOV from orderdetails;

-- Find the top 5 customers by total payment amount.
select * from payments order by amount desc limit 5;

-- List all orders along with the customer's name (join orders and customers).
 select customername,ordernumber from customers inner join orders using (customernumber) ;

-- Find the number of products in each productLine.
select productline,count(productcode)as productcount from products group by productline;

-- Get all employees along with their office city (join employees and offices).
select concat_ws(' ',lastname,firstname)as empfullname, city from employees inner join offices using (officecode);

-- Find orders with a status of 'Cancelled' or 'On Hold'.
select * from orders where status in ('Cancelled','On Hold');

-- Find the average quantityOrdered per product across all orders.
select productcode,productname, avg(quantityordered) as AVGQOPO 
from products inner join orderdetails using(productcode) group by productcode;

select productline,(sum(quantityordered)/(select sum(quantityordered)AS TQO from orderdetails ))as AQO
from orderdetails inner join products using(productcode) group by productline;

-- List employees who are reporting to more than 5 people (self-join on reportsTo).
select concat(e.firstname,' ',e.lastname)as efullname,count(m.reportsto)as empcount from 
employees e inner join employees m on e.employeenumber = m.reportsto 
group by e.employeenumber having empcount > 5;

-- Find the customer with the highest single payment (amount) ever made.
select customernumber,customername,max(amount)as MaxAmount 
from payments inner join customers using (customernumber) group by customernumber
order by MaxAmount desc limit 1;

-- Get products that have never been ordered (LEFT JOIN products with orderdetails).
select productcode, productname,productline from orderdetails right join products using(productcode)
where ordernumber is null;

-- Find total revenue per productLine.
select productline,sum(quantityordered*priceeach) as totalrevenue 
from products inner join orderdetails using(productcode) group by productline;

-- List orders placed by customers from 'France' (join orders + customers), sorted by orderDate.
select ordernumber,orderdate from orders inner join customers using(customernumber) 
where country = 'France' order by orderdate;
