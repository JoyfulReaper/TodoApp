CREATE PROCEDURE [dbo].[spUserUpsert]
	@UserId nvarchar(450),
	@EmailAddress nvarchar(256)
AS
BEGIN
	BEGIN TRANSACTION;
 
	UPDATE dbo.[User] WITH (UPDLOCK, SERIALIZABLE) 
		SET 
			[EmailAddress] = @EmailAddress
		WHERE 
			[EmailAddress] = @EmailAddress;
 
	IF @@ROWCOUNT = 0
	BEGIN
	  INSERT dbo.[User]
		([EmailAddress])
	  VALUES
		(@EmailAddress);
	END
 
	COMMIT TRANSACTION;
END