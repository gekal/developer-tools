$version = "8.0.33"
$url = "https://cdn.mysql.com//Downloads/MySQL-8.0/mysql-${version}-winx64.zip"

Write-Host "mysql version: ${version}"
Write-Host "url: ${url}"

If (!(test-path ".\mysql-${version}-winx64")) {
    $client = new-object System.Net.WebClient
    $client.DownloadFile("${url}", ".\mysql-${version}-winx64.zip")

    Write-Host "ZIPファイルを解凍して、削除する。"
    Write-Host ".\mysql-${version}-winx64.zip >>>> ."
    Expand-Archive -Path ".\mysql-${version}-winx64.zip" -DestinationPath "." -Force
    Remove-Item ".\mysql-${version}-winx64.zip"

    New-Item -ItemType Directory -Path ".\mysql-${version}-winx64\data"
    New-Item -ItemType Directory -Path ".\mysql-${version}-winx64\logs"
    New-Item -ItemType Directory -Path ".\mysql-${version}-winx64\temp"
    New-Item -ItemType Directory -Path ".\mysql-${version}-winx64\mydata"

    $mysqlBase = $(Resolve-Path -Path ".\mysql-${version}-winx64").Path

    $iniContent = @"
[mysqld]
basedir=$($mysqlBase.replace('\','\\'))\\
datadir=$($mysqlBase.replace('\','\\'))\\data

[client]
port=3306

[mysqld]
port=3306
"@

    Set-Content "${mysqlBase}\my.ini" $iniContent
}

Write-Host "何かキーを押してください。" -NoNewLine
[Console]::ReadKey() | Out-Null
