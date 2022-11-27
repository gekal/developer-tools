$version = "22.3.0"
$url = "https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${version}/graalvm-ce-java17-windows-amd64-${version}.zip"

Write-Host "jdk version: ${version}"
Write-Host "url: ${url}"

If (!(test-path ".\graalvm-ce-java17-${version}")) {
    $client = new-object System.Net.WebClient
    $client.DownloadFile("${url}", ".\graalvm-ce-java17-${version}.zip")

    Write-Host "ZIPファイルを解凍して、削除する。"
    Write-Host ".\graalvm-ce-java17-${version}.zip >>>> ."
    Expand-Archive -Path ".\graalvm-ce-java17-${version}.zip" -DestinationPath "." -Force
    Remove-Item ".\graalvm-ce-java17-${version}.zip"
}

Write-Host "環境変数を設定する"
$JAVA_HOME = Resolve-Path ".\graalvm-ce-java17-${version}"
Write-Host "JAVA_HOME = $JAVA_HOME"
[Environment]::SetEnvironmentVariable("JAVA_HOME", $JAVA_HOME, "User")
Write-Host "Pathに[%JAVA_HOME%\bin]を追加してください。"

Write-Host "何かキーを押してください。" -NoNewLine
[Console]::ReadKey() | Out-Null
