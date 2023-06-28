USE [nodemanagertest_db]
GO

print '' print '*** creating sp_delete_node ***'
GO
CREATE PROCEDURE delete_node
    @NodeID int
AS
	BEGIN
		DELETE FROM [dbo].[Nodes]
		WHERE [NodeID] = @NodeID
	END
GO