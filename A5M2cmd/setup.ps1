$version = "2.17.1"

Write-Host "A5:SQL Mk-2�t�@�C�����_�E�����[�h����B"
Write-Host "https://ftp.vector.co.jp/74/88/3301/A5M2cmd_${version}_x64.zip"

$client = new-object System.Net.WebClient
$client.DownloadFile("https://ftp.vector.co.jp/74/88/3301/A5M2cmd_${version}_x64.zip", ".\A5M2cmd_${version}_x64.zip")

Write-Host "ZIP�t�@�C�����𓀂��āA�폜����B"
Write-Host ".\A5M2cmd_${version}_x64.zip >>>> ."
Expand-Archive -Path ".\A5M2cmd_${version}_x64.zip" -DestinationPath "A5M2cmd_${version}_x64" -Force
Remove-Item ".\A5M2cmd_${version}_x64.zip"

Write-Host "�����L�[�������Ă��������B" -NoNewLine
[Console]::ReadKey() | Out-Null
