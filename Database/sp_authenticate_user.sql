USE [nodemanager_db]
GO

print '' print '*** creating sp_authenticate_user ***'
GO
CREATE PROCEDURE [dbo].[sp_authenticate_user]
(
	@Email				[nvarchar](250),
	@PasswordHash		[nvarchar](100)
)
AS
	BEGIN
		SELECT 	COUNT([UserID]) AS 'Authenticated'
		 FROM	[Users]
		WHERE	@Email = [Email]
		  AND	@PasswordHash = [PasswordHash]
		  AND	[Active] = 1
	END
GO