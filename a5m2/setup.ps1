$version = "2.17.4"

Write-Host "A5:SQL Mk-2�t�@�C�����_�E�����[�h����B"
Write-Host "https://dforest.watch.impress.co.jp/library/a/a5sqlmk2/11233/a5m2_${version}_x64.zip"

$client = new-object System.Net.WebClient
$client.DownloadFile("https://dforest.watch.impress.co.jp/library/a/a5sqlmk2/11233/a5m2_${version}_x64.zip", ".\a5m2_${version}_x64.zip")

Write-Host "ZIP�t�@�C�����𓀂��āA�폜����B"
Write-Host ".\a5m2_${version}_x64.zip >>>> ."
Expand-Archive -Path ".\a5m2_${version}_x64.zip" -DestinationPath "a5m2_${version}_x64" -Force
Remove-Item ".\a5m2_${version}_x64.zip"

Write-Host "�����L�[�������Ă��������B" -NoNewLine
[Console]::ReadKey() | Out-Null
