ECHO off

sqlcmd -S localhost -E -i nodemanager_db.sql

sqlcmd -S localhost -E -i sp_add_node.sql
sqlcmd -S localhost -E -i sp_authenticate_user.sql
sqlcmd -S localhost -E -i sp_delete_node.sql
sqlcmd -S localhost -E -i sp_select_all_nodes.sql
sqlcmd -S localhost -E -i sp_select_roles_by_userid.sql
sqlcmd -S localhost -E -i sp_select_user_by_email.sql
sqlcmd -S localhost -E -i sp_select_all_roles.sql
sqlcmd -S localhost -E -i sp_insert_user_account.sql

rem server is localhost

ECHO .
ECHO if no errors appear DB was created
PAUSE