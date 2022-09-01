CREATE PROCEDURE [dbo].[spToDoList_Get]
	@ToDoListId INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[ToDoListId], 
		[UserId], 
		[Name], 
		[DateCreated], 
		[DateDeleted]
	FROM
		dbo.[ToDoList]
	WHERE
		[ToDoListId] = @ToDoListId
END