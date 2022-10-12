$version = "3.8.6"

Write-Host "Mavenファイルをダウンロードする。"
Write-Host "https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/${version}/apache-maven-${version}-bin.zip"
$client = new-object System.Net.WebClient
$client.DownloadFile("https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/${version}/apache-maven-${version}-bin.zip", ".\apache-maven-${version}-bin.zip")

Write-Host "ZIPファイルを解凍して、削除する。"
Write-Host ".\apache-maven-${version}-bin.zip >>>> ."
Expand-Archive -Path ".\apache-maven-${version}-bin.zip" -DestinationPath "." -Force
Remove-Item ".\apache-maven-${version}-bin.zip"

Write-Host "環境変数を設定する"
$MAVEN_HOME = Resolve-Path ".\apache-maven-${version}"
Write-Host "MAVEN_HOME = $MAVEN_HOME"
[Environment]::SetEnvironmentVariable("MAVEN_HOME", $MAVEN_HOME, "User")
Write-Host "Pathに[%MAVEN_HOME%\bin]を追加してください。"

Write-Host "何かキーを押してください。" -NoNewLine
[Console]::ReadKey() | Out-Null
