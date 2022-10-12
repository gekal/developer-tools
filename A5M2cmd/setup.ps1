$version = "2.17.1"

Write-Host "A5:SQL Mk-2ファイルをダウンロードする。"
Write-Host "https://ftp.vector.co.jp/74/88/3301/A5M2cmd_${version}_x64.zip"

$client = new-object System.Net.WebClient
$client.DownloadFile("https://ftp.vector.co.jp/74/88/3301/A5M2cmd_${version}_x64.zip", ".\A5M2cmd_${version}_x64.zip")

Write-Host "ZIPファイルを解凍して、削除する。"
Write-Host ".\A5M2cmd_${version}_x64.zip >>>> ."
Expand-Archive -Path ".\A5M2cmd_${version}_x64.zip" -DestinationPath "A5M2cmd_${version}_x64" -Force
Remove-Item ".\A5M2cmd_${version}_x64.zip"

Write-Host "何かキーを押してください。" -NoNewLine
[Console]::ReadKey() | Out-Null
