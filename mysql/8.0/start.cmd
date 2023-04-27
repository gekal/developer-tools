@ECHO OFF
SET mypath=%~dp0
%mypath%\mysql-8.0.33-winx64\bin\mysqld --defaults-file="%mypath%\mysql-8.0.33-winx64\my.ini" --console
