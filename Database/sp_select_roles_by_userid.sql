USE [nodemanager_db]
GO

print '' print '*** creating sp_select_roles_by_userid ***'
GO
CREATE PROCEDURE [dbo].[sp_select_roles_by_UserID]
(
	@UserID		[int]			
)
AS
	BEGIN
		SELECT 	[RoleID]
		FROM	[UsersRoles]
		WHERE	@UserID = [UserID]
	END
GO