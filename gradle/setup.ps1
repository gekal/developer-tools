$version = "7.5.1"

Write-Host "Gradleファイルをダウンロードする。"
Write-Host "https://services.gradle.org/distributions/gradle-${version}-bin.zip"
$client = new-object System.Net.WebClient
$client.DownloadFile("https://services.gradle.org/distributions/gradle-${version}-bin.zip", ".\gradle-${version}-bin.zip")

Write-Host "ZIPファイルを解凍して、削除する。"
Write-Host ".\gradle-${version}-bin.zip >>>> ."
Expand-Archive -Path ".\gradle-${version}-bin.zip" -DestinationPath "." -Force
Remove-Item ".\gradle-${version}-bin.zip"

Write-Host "環境変数を設定する"
$GRADLE_HOME = Resolve-Path ".\gradle-${version}"
Write-Host "GRADLE_HOME = $GRADLE_HOME"
[Environment]::SetEnvironmentVariable("GRADLE_HOME", $GRADLE_HOME, "User")
Write-Host "Pathに[%GRADLE_HOME%\bin]を追加してください。"

Write-Host "何かキーを押してください。" -NoNewLine
[Console]::ReadKey() | Out-Null
