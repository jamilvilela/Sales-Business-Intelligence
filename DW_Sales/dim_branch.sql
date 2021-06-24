CREATE TABLE [sales].dim_branch
(
	[sk_branch] INT NOT NULL IDENTITY, 
	[id_branch] INT NOT NULL, 
    [branch_name] NVARCHAR(100) NULL, 
    [country_name] NVARCHAR(100) NULL, 
    [city_name] NVARCHAR(100) NULL, 
	startdate datetime,
	enddate datetime,
    CONSTRAINT [PK_dim_branch] PRIMARY KEY ([sk_branch])
)
