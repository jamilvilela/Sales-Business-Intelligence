CREATE TABLE [sales].dim_product
(
	[sk_product] INT NOT NULL IDENTITY, 
	[id_product] INT NOT NULL , 
    [product_name] NVARCHAR(100) NULL, 
    [desciption] NVARCHAR(100) NULL, 
    [id_subcategory] INT NULL, 
    [subcatecory_name] NVARCHAR(100) NULL, 
    [id_category] INT NULL, 
    [category_name] NVARCHAR(100) NULL, 
    cost_price MONEY NULL,
    sell_price MONEY NULL,
    margin MONEY NULL,
    margin_rate NUMERIC(18, 2) NULL,
	startdate datetime,
	enddate datetime, 
    CONSTRAINT [PK_product] PRIMARY KEY ([sk_product]),
)
