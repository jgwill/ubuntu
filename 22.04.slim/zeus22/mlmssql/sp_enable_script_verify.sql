EXEC sp_execute_external_script @script=N'print(R.version)',@language=N'R';
GO