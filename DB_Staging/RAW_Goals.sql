CREATE TABLE [sales].[RAW_Goals]
(
	[id_seller] INT NOT NULL,
	[seller_name] [nvarchar](255) NULL,
	[2017] [numeric](18, 4) NULL,
	[2018] [numeric](18, 4) NULL,
	[2019] [numeric](18, 4) NULL,
	[2020] [numeric](18, 4) NULL, 
    CONSTRAINT [PK_RAW_Goals] PRIMARY KEY ([id_seller])
) 

