USE [nodemanager_db]
GO

print '' print '*** creating sp_select_all_nodes ***'
GO
	CREATE PROCEDURE sp_select_all_nodes
	AS
	BEGIN
		SELECT [NodeID], [IPAddress], [Responding]
		FROM [dbo].[Nodes]
	END
GO