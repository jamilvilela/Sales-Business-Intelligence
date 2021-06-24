﻿CREATE TABLE [sales].fact_sales
(
	[sk_sale] INT NOT NULL IDENTITY, 
    [expiration_date] DATE NULL, 
    [order_number] NVARCHAR(50) NULL, 
    [pay_date] DATE NULL, 
    [quantity] NUMERIC(18, 2) NULL, 
    [vl_unit] MONEY NULL, 
    [vl_discount] MONEY NULL, 
    [vl_sale_total] MONEY NULL, 
    [discount_rate] NUMERIC(18, 2) NULL, 
    [vl_pay_total] MONEY NULL, 
    [sk_product] INT NULL, 
    [sk_seller] INT NULL, 
    [sk_manager] INT NULL, 
    [sk_branch] INT NULL, 
    [sk_customer] INT NULL,
    [sk_date] DATETIME NULL, 
    CONSTRAINT [FK_sale_product] FOREIGN KEY ([sk_product]) REFERENCES [sales].dim_product([sk_product]), 
    CONSTRAINT [FK_sales_seller] FOREIGN KEY ([sk_seller]) REFERENCES [sales].dim_seller([sk_seller]), 
    CONSTRAINT [FK_sales_manager] FOREIGN KEY ([sk_manager]) REFERENCES [sales].[dim_manager]([sk_manager]), 
    CONSTRAINT [FK_sales_brunch] FOREIGN KEY ([sk_branch]) REFERENCES [sales].dim_branch([sk_branch]), 
    CONSTRAINT [FK_sales_customer] FOREIGN KEY ([sk_customer]) REFERENCES [sales].[dim_customer]([sk_customer]), 
    CONSTRAINT [FK_sales_date] FOREIGN KEY ([sk_date]) REFERENCES [sales].[dim_time]([sk_date]),
    CONSTRAINT [PK_sales] PRIMARY KEY ([sk_sale])
)