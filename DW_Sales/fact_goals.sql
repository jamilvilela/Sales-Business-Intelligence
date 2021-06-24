CREATE TABLE [sales].[fact_goals]
(
	[sk_goal] INT NOT NULL IDENTITY, 
    [sk_seller] INT NOT NULL, 
    [sk_date] DATETIME NOT NULL, 
    [vl_goal] NUMERIC(18, 4) NOT NULL, 
    CONSTRAINT [FK_goals_seller] FOREIGN KEY ([sk_seller]) REFERENCES [sales].[dim_seller]([sk_seller]), 
    CONSTRAINT [FK_goals_date] FOREIGN KEY ([sk_date]) REFERENCES [sales].[dim_time]([sk_date]), 
    CONSTRAINT [PK_fact_goals] PRIMARY KEY ([sk_goal])
)
