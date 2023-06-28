/* check whether the database exists, and if so, delete it */
IF EXISTS (SELECT 1 FROM master.dbo.sysdatabases
				WHERE name = 'nodemanager_db')
BEGIN
	DROP DATABASE nodemanager_db
	print '' print '*** dropped database nodemanager_db ***'
END

print '' print '*** creating database nodemanager_db ***'

CREATE DATABASE nodemanager_db
GO

print '' print '*** using database nodemanager_db ***'

USE [nodemanager_db]
GO

/* User table */
print '' print '*** creating users table ***'
GO
CREATE TABLE [dbo].[Users] (
	[UserID]		[int] IDENTITY(10000,1)		NOT NULL,
	[FirstName]		[nvarchar](50)				NOT NULL,
	[LastName]		[nvarchar](100)				NOT NULL,
	[Phone]			[nvarchar](13)				NOT NULL,
	[Email]			[nvarchar](250)				NOT NULL,
	[PasswordHash]	[nvarchar](100)				NOT NULL DEFAULT
		'b03ddf3ca2e714a6548e7495e2a03f5e824eaac9837cd7f159c67b90fb4b7342',
	[Active]		[bit]						NOT NULL DEFAULT 1,
	CONSTRAINT [pk_UserID] 	PRIMARY KEY([UserID]),
	CONSTRAINT [ak_Email] 	UNIQUE([Email])
)

/* User records */
print '' print '*** inserting users records ****'
GO
INSERT INTO [dbo].[Users]
		([FirstName], [LastName], [Phone], [Email], [PasswordHash], [Active])
    VALUES
		('Henry', 'Waternoose', '3195551111', 'henry@company.com', 'b03ddf3ca2e714a6548e7495e2a03f5e824eaac9837cd7f159c67b90fb4b7342', 1),
		('Mike', 'Wazowski', '3195552222', 'mike@company.com', 'b03ddf3ca2e714a6548e7495e2a03f5e824eaac9837cd7f159c67b90fb4b7342', 1),
		('James', 'Sullivan', '3195553333', 'james@company.com', 'b03ddf3ca2e714a6548e7495e2a03f5e824eaac9837cd7f159c67b90fb4b7342', 1),
		('Randall', 'Boggs', '3195554444', 'randall@company.com', 'b03ddf3ca2e714a6548e7495e2a03f5e824eaac9837cd7f159c67b90fb4b7342', 1)
GO

/* Roles table and data */
print '' print '*** creating roles table ***'
GO
CREATE TABLE [dbo].[Roles] (
	[RoleID]		[nvarchar](50)	NOT NULL,
	[Description]	[nvarchar](250)	NULL,
	CONSTRAINT [pk_RoleID] PRIMARY KEY ([RoleID])
)

print '' print '*** inserting roles records ***'
	INSERT INTO [dbo].[Roles]
		([RoleID], [Description])
	VALUES
		('Admin', 'administers application and can make changes to critical items'),
		('User', 'users of the application')
GO

/*** UsersRoles join table to join Users and Roles ***/

print '' print '*** creating usersroles table ***'
GO
CREATE TABLE [dbo].[UsersRoles] (
	[UserID]		[int] 						NOT NULL,	
	[RoleID]		[nvarchar](50)				NOT NULL,	
	CONSTRAINT [fk_UsersRoles_UserID] FOREIGN KEY ([UserID])
		REFERENCES [dbo].[Users]([UserID]),	
	CONSTRAINT [fk_UsersRoles_RoleID] FOREIGN KEY ([RoleID])
		REFERENCES [dbo].[Roles]([RoleID]),
	CONSTRAINT [pk_UsersRoles] PRIMARY KEY ([UserID], [RoleID])
)

print '' print '*** inserting usersroles records ***'
GO
INSERT INTO [dbo].[UsersRoles]
		([UserID], [RoleID])
	VALUES
		(10000, 'Admin'),
		(10001, 'User'),
		(10002, 'User'),
		(10003, 'User')
GO

/*** Nodes table ***/

print '' print '*** inserting nodes table ***'
GO
CREATE TABLE [dbo].[Nodes] (
	[NodeID]		[int] IDENTITY(1,1)	NOT NULL,
	[IPAddress]		[nvarchar](12),
	[Responding]	[bit],
	CONSTRAINT 		[pk_NodeID] 		PRIMARY KEY([NodeID])
)

print '' print '*** inserting nodes records ****'
GO
INSERT INTO [dbo].[Nodes]
		([IPAddress], [Responding])
    VALUES
		(1722171110,1),
		(18512519029,1),
		(1726714863,1),
		(1308914877,1),
		(4089244232,1)
GO

print '' print '*** implementing stored procedures ***'
GO