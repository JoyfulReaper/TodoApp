CREATE PROCEDURE [dbo].[spToDoItem_Upsert]
	@ToDoItemId INT,
	@ToDoListId INT,
	@Name NVARCHAR(150),
	@DateCompleted DATETIME2(7),
	@DateDeleted DATETIME2(7)
AS
BEGIN
	BEGIN TRANSACTION
		
		UPDATE dbo.[ToDoItem] WITH (UPDLOCK, SERIALIZABLE)
			SET
				[Name] = @Name,
				[DateCompleted] = @DateCompleted,
				[DateDeleted] = @DateDeleted
			WHERE
				[ToDoItemId] = @ToDoItemId;

		IF @@ROWCOUNT = 0
		BEGIN
			INSERT dbo.[ToDoItem]
				([ToDoListId],
				[Name],
				[DateCompleted],
				[DateDeleted])
			VALUES
				(@ToDoListId,
				@Name,
				@DateCompleted,
				@DateDeleted);
			
			SET @ToDoItemId = SCOPE_IDENTITY();
		END

	COMMIT TRANSACTION
	
	SELECT @ToDoItemId;
END