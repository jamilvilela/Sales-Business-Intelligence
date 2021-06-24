CREATE TABLE [sales].[dim_manager]
(
	[sk_manager] INT NOT NULL IDENTITY, 
	[id_manager] INT NOT NULL , 
    [manager_name] NVARCHAR(100) NULL,
	[country_name] NVARCHAR(100) NULL,
	[city_name] NVARCHAR(100) NULL,
	startdate datetime,
	enddate datetime,
    CONSTRAINT [PK_manager] PRIMARY KEY ([sk_manager])
)
