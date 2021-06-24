CREATE TABLE [audit].[log] (
    [Id]           INT             IDENTITY (1, 1) NOT NULL,
    [error_code]   INT             NULL,
    [error_column] INT             NULL,
    [date_time]    DATETIME        NOT NULL,
    [description]  NVARCHAR (4000) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

