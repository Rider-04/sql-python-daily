-- SQL — Level 1 (Basics)
use dummy;

-- Select all columns from the customers table.
select * from customers;

-- List productName, buyPrice, and MSRP from products.
select productname, buyprice , msrp from products;

-- Find all customers located in 'USA'.
select * from customers where country = "USA";

-- Get all orders with status = 'Shipped'.
select * from orders where status = 'Shipped';

-- List distinct country values from customers.
select distinct(country) as "Dis_countries" from customers;

-- Find products with quantityInStock less than 1000.
select * from products where quantityinstock <1000;

-- Get all employees whose jobTitle is 'Sales Rep'.
select * from employees where jobtitle = "Sales Rep";

-- Sort products by buyPrice in descending order.
select * from products order by buyprice desc;

-- Find all payments where amount is greater than 50000.
select * from payments where amount > 50000;

-- Count the total number of customers.
select count(*) as Total_custoemrs from customers;

-- Find the average MSRP of all products.
select avg(msrp) as Avg_MSRP from products;

-- List orders placed in the year 2004 (use orderDate).
select * from orders where year(orderdate) = 2004;

-- Find customers whose customerName starts with 'A'.
select * from customers where customername like "A%";

-- Get the top 5 most expensive products (by MSRP).
select * from products order by msrp desc limit 5;

-- Find all offices located in 'USA' or 'France'.
select * from offices where country in ('USA','France');