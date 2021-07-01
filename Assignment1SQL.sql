Select all products with brand Cacti Plus
Select * from dbo.product where brand = 'Cacti Plus'

Count of total products with product category=Skin Care
Select count(*) from dbo.product where category = 'Skin Care' 

Count of total products with MRP more than 100
Select count(*) from dbo.product where MRP > 100

Count of total products with product category=Skin Care and MRP more than 100
Select count(*) from dbo.product where category = 'Skin Care' and MRP > 100

Brandwise product count
Select count(*) from dbo.product group by brand

Brandwise as well as Active/Inactive Status wise product count
Select count(*) from dbo.product where Active in ('Y','N') group by brand 

Display all columns with Product category in Skin Care or Hair Care
select * from dbo.product where category = 'Skin Care' or category = 'Hair Care'

Display all columns with Product category in Skin Care or Hair Care, and MRP more than 100
select * from dbo.product where category = 'Skin Care' or category = 'Hair Care' and MRP > 100

Display   all   columns   with   Product   category=Skin   Care   and
Brand=Pondy, and MRP more than 100
select * from dbo.product where category = 'Skin Care' and Brand = 'Pondy' and MRP > 100

Display   all   columns   with   Product   category   =Skin   Care   or
Brand=Pondy, and more than 100
select * from dbo.product where category = 'Skin Care' or Brand = 'Pondy' and MRP > 100

Display all product names only with names starting from letter P
Select * from dbo.product where product_name like'P%'

Display  all product  names only with names Having letters Bar  in Between
Select * from dbo.product where product_name like '%bar%'

Sales of those products which have been sold in more than two quantity in a bill
select * from dbo.sales where qty > 2

Sales of those products which have been sold in more than two quantity throughout the bill
select product_id,sum(qty) from dbo.sales group by product_id having sum(qty)>2

Create a new table with columns username and birthday, and dump data from dates file. Convert it to .csv format if required.
CREATE TABLE employee (
  user_name varchar(20),
  birthday  date,
)

BULK INSERT dbo.employee 
FROM 'C:\Users\sumana\Downloads\dates.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR ='\n'
)

Research on Date Function Queries from the slide
The date function query extracts the date part of a date or date/time expression

After populating the data, find no of people sharing
Birth date
select count(user_name) from dbo.employee where birthday IN( select birthday from dbo.employee group by birthday having count(birthday)> 1)

Find no of people sharing Birth month
select COUNT(username) from dbo.employee where birthday IN( select birthday from dbo.employee group by birthday having count(birthday)> 1)

Find no of people sharing weekday
select COUNT(username), DATENAME(weekday, GETDATE()) as WEEKDAY from dbo.employee

Find the current age of all people
select *, DATEDIFF(year, birthday, GETDATE()) Age from dbo.employee


