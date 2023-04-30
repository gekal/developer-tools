$version = "2.4.55"
$url = "https://www.apachehaus.com/downloads/httpd-${version}-o111s-x64-vs17.zip"

Write-Host "apache version: ${version}"
Write-Host "url: ${url}"

If (!(test-path ".\mysql-${version}-winx64")) {
    $client = new-object System.Net.WebClient
    $client.DownloadFile("${url}", ".\httpd-${version}-o111s-x64-vs17.zip")

    Write-Host "ZIPファイルを解凍して、削除する。"
    Write-Host ".\httpd-${version}-o111s-x64-vs17.zip >>>> ."
    Expand-Archive -Path ".\httpd-${version}-o111s-x64-vs17.zip" -DestinationPath "." -Force
    Remove-Item ".\httpd-${version}-o111s-x64-vs17.zip"
}

Write-Host "何かキーを押してください。" -NoNewLine
[Console]::ReadKey() | Out-Null
