USE [nodemanager_db]
GO

print '' print '*** creating sp_select_user_by_email ***'
GO
CREATE PROCEDURE [dbo].[sp_select_user_by_email]
(
	@Email				[nvarchar](250)			
)
AS
	BEGIN
		SELECT 	[UserID], [FirstName], [LastName], 
				[Phone], [Email], [Active]
		FROM	[Users]
		WHERE	@Email = [Email]
	END
GO