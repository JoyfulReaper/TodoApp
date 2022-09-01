CREATE PROCEDURE [dbo].[spToDoItem_Get]
	@ToDoItemId int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[ToDoItemId], 
		[ToDoListId],
		[Name],
		[DateCreated],
		[DateCompleted], 
		[DateDeleted]
	FROM
		dbo.[ToDoItem]
	WHERE
		[ToDoItemId] = @ToDoItemId;
END