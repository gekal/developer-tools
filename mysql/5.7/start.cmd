@ECHO OFF
SET mypath=%~dp0
%mypath%\mysql-5.7.41-winx64\bin\mysqld --defaults-file="%mypath%\mysql-5.7.41-winx64\my.ini" --console
