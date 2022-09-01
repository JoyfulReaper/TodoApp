﻿CREATE TABLE [dbo].[User]
(
	[UserId] NVARCHAR(450) NOT NULL PRIMARY KEY, 
    [EmailAddress] NVARCHAR(256) NOT NULL, 
    [DateCreated] DATETIME2 NOT NULL DEFAULT GETUTCDATE()
)
