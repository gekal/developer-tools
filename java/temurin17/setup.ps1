$version = "17.0.4.1+1"
$url = "https://github.com/adoptium/temurin17-binaries/releases/download/jdk-${version}/OpenJDK17U-jdk_x64_windows_hotspot_$($version.Replace('+', '_')).zip"

Write-Host "jdk version: ${version}"
Write-Host "url: ${url}"

If (!(test-path ".\jdk-${version}")) {
    $client = new-object System.Net.WebClient
    $client.DownloadFile("${url}", ".\OpenJDK17U-jdk_x64_windows_hotspot_$($version.Replace('+', '_')).zip")

    Write-Host "ZIPファイルを解凍して、削除する。"
    Write-Host ".\OpenJDK17U-jdk_x64_windows_hotspot_$($version.Replace('+', '_')).zip >>>> ."
    Expand-Archive -Path ".\OpenJDK17U-jdk_x64_windows_hotspot_$($version.Replace('+', '_')).zip" -DestinationPath "." -Force
    Remove-Item ".\OpenJDK17U-jdk_x64_windows_hotspot_$($version.Replace('+', '_')).zip"
}

Write-Host "環境変数を設定する"
$JAVA_HOME = Resolve-Path ".\jdk-${version}"
Write-Host "JAVA_HOME = $JAVA_HOME"
[Environment]::SetEnvironmentVariable("JAVA_HOME", $JAVA_HOME, "User")
Write-Host "Pathに[%JAVA_HOME%\bin]を追加してください。"

Write-Host "何かキーを押してください。" -NoNewLine
[Console]::ReadKey() | Out-Null
