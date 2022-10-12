@ECHO OFF

SET CURRENT_PATH=%~dp0
powershell -noprofile -command "&{ start-process powershell -ArgumentList '-noprofile -file %CURRENT_PATH%setup.ps1' -verb RunAs}"
