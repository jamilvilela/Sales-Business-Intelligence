CREATE TABLE [sales].[dim_customer]
(
	[sk_customer] INT NOT NULL IDENTITY, 
	[id_customer] INT NOT NULL , 
    [customer_name] NVARCHAR(100) NULL, 
    [city_name] NVARCHAR(100) NULL,
	[country_name] nvarchar(100) null,
	startdate datetime,
	enddate datetime,
    CONSTRAINT [PK_customer] PRIMARY KEY ([sk_customer])
)
