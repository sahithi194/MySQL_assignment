# Exercise 1
create database hotel_management;
CREATE TABLE customers(cust_id int primary key not null, cust_name varchar(50), cust_city varchar(50), cust_roomNo int, chekIn_time datetime);
INSERT INTO customers values
(1, 'Vijay', 'Dallas', 101, '2022-10-11 12:00:00'),
(2, 'Sam', 'Sanfransico', 201, '2022-10-15 9:00:00'),
(3, 'Srini', 'Dallas', 222, '2022-09-22 13:00:00'),
(4, 'Pooran', 'chicago', 103, '2022-08-06 16:00:00'),
(5, 'Vijay', 'Dallas', 105, '2022-09-12 10:00:00');

SELECT * from customers;


# Exercise 2
#----1.Print Distinct City from Table Customers and Print Count Distinct City from Table Customers.------
 
 select count(distinct City)as count_of_distinct_city from customers;
 select distinct City from customers ;

 #----2.Write a SQL query to get the least number of quantities and
#---the highest number of quantities bought by the user consider the OrderDetails Table.

select max(Quantity)as max_quantity, min(Quantity) as min_quantity from order_details;

#---3.Print the total and an average number of quantities ordered by users, consider the OrderDetails Table.

select * from order_details;
select count(Quantity) as total_quantity, avg(Quantity) as avg_quantity from order_details;

#----4.Print name of the product which is present at the 5th position till the 15th position from Products table, use LIMIT keyword.

select * from products;
select ProductName from products order by ProductID limit 11 offset 4;

#----5.Write a SQL query for all the details of the supplier whose name consists of "A" at the second position from the Suppliers table
select * from suppliers;
select * from suppliers where SupplierName like '_a%'; 

#----6.Print the details of the customer who doesn't stay in the USA and Canada from the Customers table.
select * from customers;
select * from customers where Country NOT IN ('USA', 'Canada');

#---7.Print the details of all the orders which were placed betweenthe year 2020 to 2021 also print the same in descending order
#--from the OrderDetails table.

select * from orders inner join order_details on order_details.OrderID = orders.OrderID where orders.OrderDate between 2020 and 2021
order by OrderDate desc;

#----8.Write a query to show the distinct city and their count from the Customers table.

select distinct City, count(*) as count_of_city from customers
group by  City; 


#-----9.Write a query to fetch details of all employees excluding the employees with first names, "Sanjay" and "Soniya" from the Employees table.

select * from employees;
SELECT * FROM employees WHERE LastName  NOT IN ('Sanjay','Soniya');

#----10.Duplicate a table as similar to the Suppliers table and name it as SupplierDetail.
 
 select * from  suppliers;
create table supplier_detail as select * from suppliers;


#----11.Delete customer details whose country is Venezuela and print the rest of the Customer table
 select * from customers;
delete from customers where Country = 'Venezuela';