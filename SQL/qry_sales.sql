use DB_Stage
go

select count(*) from sales.RAW_Sales
go
select * from sales.RAW_Sales
go

	SELECT *--id_seller, sale_date, order_number, id_branch, id_product, id_customer, id_manager, expiration_date, unit_price, quantity, sale_total_price, sale_discount, discount_percent, payment_total, payment_date
	FROM   sales.RAW_Sales
	where id_product = 87

select id_branch, sale_date, order_number, count(*)
from sales.RAW_Sales
group by id_branch, sale_date, order_number
having count(*) > 1


use DM_Sales
go
select count(*) from [sales].[dim_date]
select * from [sales].[dim_date]
go
select count(*) from [sales].[dim_branch]
go
select count(*) from [sales].[dim_customer]
go
select count(*) from [sales].[dim_manager]
go
select count(*) from [sales].[dim_product]
go
select * from [sales].[dim_product]

SELECT 
	id_product, SUBSTRING(product_name, 1, 100) AS product_name, 
	id_category, SUBSTRING(category_name, 1, 100) AS category_name, 
	id_subcategory, SUBSTRING(subcategory_name, 1, 100) AS subcategory_name, 
	SUBSTRING(product_description, 1, 100) AS product_description, 
	avg(cost_price) cost_price, avg(sale_price) sale_price, avg(margin) margin, avg(margin_percent) margin_percent
FROM     sales.RAW_Sales 
GROUP BY id_product, SUBSTRING(product_name, 1, 100), 
		id_category, SUBSTRING(category_name, 1, 100), 
		id_subcategory, SUBSTRING(subcategory_name, 1, 100), 
		SUBSTRING(product_description, 1, 100)


SELECT * --id_product, product_name, desciption, id_subcategory, subcatecory_name, id_category, category_name, cost_price, sell_price, margin, margin_rate, enddate
FROM     sales.dim_product
WHERE id_product = 50 -- (enddate IS NULL)

go
select count(*) from [sales].[dim_seller]
go
select count(*) from [sales].[fact_sales]
select f.vl_sale_total,(f.quantity*f.vl_unit)-f.vl_discount, f.* from [sales].[fact_sales] f
go
select count(*) from [sales].[dim_date] 
go
select * from audit.log
go