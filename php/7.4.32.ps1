$command = $MyInvocation.MyCommand.Name

$version = $command.Substring(0, $command.Length - 4)

. .\setup-vc15.ps1

init($version);

Write-Host "�����L�[�������Ă��������B" -NoNewLine
[Console]::ReadKey() | Out-Null
