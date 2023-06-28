USE [nodemanagertest_db]
GO

print '' print '*** creating sp_add_node ***'
GO
CREATE PROCEDURE add_node
    @IPAddress 	nvarchar,
    @Responding bit
AS
	BEGIN
		INSERT INTO [dbo].[Nodes]
			([IPAddress], [Responding])
		VALUES
			(@IPAddress, @Responding)
	END
GO