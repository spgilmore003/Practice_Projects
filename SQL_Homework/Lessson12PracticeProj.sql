
/* Develop tables for products, customers, and sales with fields within the data files. 
 Make sure to establish Primary and Foreign Keys were appropriate*/


Create Table if not Exists Products(
	p_code INTEGER Primary Key Autoincrement,
	p_name VARCHAR(50),
	price Integer,
	stock Integer,
	category VARCHAR(50)
	);
	

Create Table if not Exists Customers(
	c_id INTEGER Primary Key Autoincrement,
	c_name VARCHAR(50),
	c_location VARCHAR(50),
	c_phoneno VARCHAR(50)
	);

Create Table if not Exists Sales(
	order_date VARCHAR(50),
	order_no VARCHAR(50) Primary Key,
	c_id Integer References Customers(c_id),
	c_name VARCHAR(50),
	s_code Integer References Products(p_code),
	p_name VARCHAR(50),
	quantity Integer,
	price Integer
	);

---Write a query to insert values into at least 1 of the 3 customer, product, and sales tables.

	Insert Into Sales(order_date,order_no,c_id,c_name,s_code,p_name,quantity,price)
	VALUES ('7/24/2016','HM06','9212','Jessica','11','pencil','3','30'),
	       ('10/19/2016','HM09','3921','Mukesh','17','biscuits','10','600'),
	       ('10/30/2016','HM10','9875','Stephen','2','cornoto','10','500'),
	       ('2/5/2018','HM03','1212','Oliver','20','kiwi','3','420'),
	       ('9/20/2018','HM05','1910','Mohan','20','kiwi','2','280');

	
	Insert Into Sales(order_date,order_no,c_id,c_name,s_code,p_name,quantity,price)
	VALUES ('12/4/2018','HM08','5334','Chirsty','16','chocolate','2','50'),
		   ('3/15/2019','HM07','1246','Vignesh','19','apple','5','600'),
		   ('11/1/2019','HM01','1910','Mohan','5','mayanoise','4','360'),
		   ('10/2/2021','HM04','1111','Nisha','25','conditioner','5','1000'),
           ('12/2/2021','HM02','2123','Biyush','3','Pen','2','20');
	

---The product "mayanoise" is misspelled in the Products and Sales Tables, I corrected it here
	Update Products
	Set p_name = 'mayonnaise'
	Where p_name ='mayanoise';

Update Sales
	Set p_name = 'mayonnaise'
	Where p_name ='mayanoise';

--- Write a query to display the order ID, customer ID, order date, price, and quantity columns of the sales table

Select order_no, c_id, order_date, price, quantity
From Sales;
 
---Write a query to show details from the product table where the category is stationary

Select p_code, p_name, category
From Products
Where category = 'Stationary';

---Write a query to display the unique categories in the product table

Select distinct category
From Products;

---Write a query to display the product details in descending order of price

SELECT * 
FROM Products 
ORDER BY price DESC;




	
	
	
	
	
	
	
	
	
	
	