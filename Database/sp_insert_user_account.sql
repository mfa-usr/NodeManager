USE [nodemanager_db]
GO

print '' print '*** creating sp_insert_user_account ***'
GO
CREATE PROCEDURE [dbo].[sp_insert_user_account]
(
    @FirstName           [nvarchar](50),
    @LastName       	 [nvarchar](100),
    @Phone       		 [nvarchar](13),
    @Email               [nvarchar](250),
    @PasswordHash        [nvarchar](100),
    @Active              [bit]
)
AS
    BEGIN
        INSERT INTO [dbo].[Users]
            ([FirstName], [LastName],[Phone], [Email], [PasswordHash], [Active])
        VALUES
            (@FirstName, @LastName, @Phone, @Email, @PasswordHash, @Active)
            
        SELECT SCOPE_IDENTITY()
    END
GO