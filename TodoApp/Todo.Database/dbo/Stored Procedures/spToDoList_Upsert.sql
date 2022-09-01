CREATE PROCEDURE [dbo].[spToDoList_Upsert]
	@ToDoListId INT,
	@UserId nvarchar(450),
	@Name nvarchar(150),
	@DateDeleted datetime2(7)
AS
BEGIN

	BEGIN TRANSACTION;
 
	UPDATE dbo.[ToDoList] WITH (UPDLOCK, SERIALIZABLE) 
		SET
			[Name] = @Name,
			[DateDeleted] = @DateDeleted
		WHERE 
			[ToDoListId] = @ToDoListId;
 
	IF @@ROWCOUNT = 0
	BEGIN
		INSERT dbo.[ToDoList]
			([UserId],
			[Name],
			[DateDeleted])
		VALUES
			(@UserId,
			@Name,
			@DateDeleted);

		SET @ToDoListId = SCOPE_IDENTITY();
	END
 
	COMMIT TRANSACTION;

	SELECT @ToDoListId;
END