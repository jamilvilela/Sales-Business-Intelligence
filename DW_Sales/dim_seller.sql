CREATE TABLE [sales].dim_seller
(
	[sk_seller] INT NOT NULL IDENTITY, 
	[id_seller] INT NOT NULL , 
    [seller_name] NVARCHAR(100) NULL, 
	startdate datetime,
	enddate datetime,
    CONSTRAINT [PK_seller] PRIMARY KEY ([sk_seller])
)
