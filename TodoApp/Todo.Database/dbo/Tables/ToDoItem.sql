﻿CREATE TABLE [dbo].[ToDoItem]
(
	[ToDoItemId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ToDoListId] INT NOT NULL, 
    [Name] NVARCHAR(150) NOT NULL, 
    [DateCreated] DATETIME2 NOT NULL DEFAULT GETUTCDATE(), 
    [DateCompleted] DATETIME2 NULL, 
    [DateDeleted] DATETIME2 NULL, 
    CONSTRAINT [FK_ToDoItem_ToDoList] FOREIGN KEY ([ToDoListId]) REFERENCES [ToDoList]([ToDoListId])
)
