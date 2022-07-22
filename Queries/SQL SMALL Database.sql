
--Q1
select First_Name, Last_Name, City 
from tbl_customers;

--Q2
select * 
from tbl_customers;

--Q3
Select Distinct State 
from tbl_customers;

--Q4
Select State 
from tbl_customers;

--Q5
Select First_Name, Last_Name, State 
from tbl_customers
Where State = 'NJ';

--Q6
Select First_Name, Last_Name, State 
from tbl_customers
Where State is 'NJ';

--Q7
Select First_Name, Last_Name, State 
from tbl_customers
Where State is 'NJ' and Last_Name='Winer';

--Q8
select * 
from tbl_customers
Order by City;

--Q9
select * 
from tbl_customers
Order by City Desc, Customer_ID Asc;

--E1
select Last_Name, Address_Line_1, State
from tbl_customers
Where State in ('TX','NJ');

--E2
select Last_Name, Address_Line_1, State
from tbl_customers
where Customer_ID in (select Customer_ID
                      from tbl_sales
                      where Sale_Date = '4/18/2016');

--Q10
select MAX(Sales_amount) 
from  tbl_sales;

--Q11
select Count(Customer_ID) 
from tbl_customers
Where State in ('TX','NJ');


--Q12
select * 
from tbl_customers inner join tbl_sales
                   on tbl_customers.Customer_ID = tbl_sales.Customer_ID;

--E3
select distinct First_Name, Last_Name, Address_Line_1
from tbl_customers inner join tbl_sales
                   on tbl_customers.Customer_ID = tbl_sales.Customer_ID
Where Description == 'Internet Purchase';

--E4
select distinct First_Name, Last_Name, Address_Line_1
from tbl_customers 
     inner join tbl_sales
                on tbl_customers.Customer_ID = tbl_sales.Customer_ID
     inner join tbl_products
                on tbl_products.Product_ID = tbl_sales.Product_ID
Where Product_Name = 'Shoe Shine';

--Q15
select *
from  tbl_sales              
     inner join tbl_products
                on tbl_products.Product_ID = tbl_sales.Product_ID;
