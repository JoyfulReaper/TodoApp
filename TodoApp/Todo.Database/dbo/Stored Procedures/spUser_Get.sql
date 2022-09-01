CREATE PROCEDURE [dbo].[spUser_Get]
	@UserId nvarchar(450)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[UserId], 
		[EmailAddress],
		[DateCreated]
	FROM
		dbo.[User]
	WHERE
		[UserId] = @UserId;
END