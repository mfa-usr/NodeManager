USE [nodemanagertest_db]
GO

print '' print '*** creating sp_select_all_roles ***'
GO
CREATE PROCEDURE [sp_select_all_roles]
AS
BEGIN
	SELECT [RoleID]
	FROM [dbo].[Roles]
	ORDER BY [RoleID]
END
GO