$version = "2.19.0"

Write-Host "A5:SQL Mk-2�t�@�C�����_�E�����[�h����B"
Write-Host "https://ftp.vector.co.jp/76/65/2526/a5m2_${version}_x64.zip"

$client = new-object System.Net.WebClient
$client.DownloadFile("https://ftp.vector.co.jp/76/65/2526/a5m2_${version}_x64.zip", ".\a5m2_${version}_x64.zip")

Write-Host "ZIP�t�@�C�����𓀂��āA�폜����B"
Write-Host ".\a5m2_${version}_x64.zip >>>> ."
Expand-Archive -Path ".\a5m2_${version}_x64.zip" -DestinationPath "a5m2_${version}_x64" -Force
Remove-Item ".\a5m2_${version}_x64.zip"

Write-Host "�����L�[�������Ă��������B" -NoNewLine
[Console]::ReadKey() | Out-Null
