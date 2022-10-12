$version = "2.17.4"

Write-Host "A5:SQL Mk-2ファイルをダウンロードする。"
Write-Host "https://dforest.watch.impress.co.jp/library/a/a5sqlmk2/11233/a5m2_${version}_x64.zip"

$client = new-object System.Net.WebClient
$client.DownloadFile("https://dforest.watch.impress.co.jp/library/a/a5sqlmk2/11233/a5m2_${version}_x64.zip", ".\a5m2_${version}_x64.zip")

Write-Host "ZIPファイルを解凍して、削除する。"
Write-Host ".\a5m2_${version}_x64.zip >>>> ."
Expand-Archive -Path ".\a5m2_${version}_x64.zip" -DestinationPath "a5m2_${version}_x64" -Force
Remove-Item ".\a5m2_${version}_x64.zip"

Write-Host "何かキーを押してください。" -NoNewLine
[Console]::ReadKey() | Out-Null
