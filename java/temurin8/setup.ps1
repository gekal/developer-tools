$version = "8u345-b01"
$url = "https://github.com/adoptium/temurin8-binaries/releases/download/jdk${version}/OpenJDK8U-jdk_x64_windows_hotspot_$($version.Replace('-', '')).zip"

Write-Host "jdk version: ${version}"
Write-Host "url: ${url}"

If (!(test-path ".\jdk${version}")) {
    $client = new-object System.Net.WebClient
    $client.DownloadFile("${url}", ".\OpenJDK8U-jdk_x64_windows_hotspot_$($version.Replace('-', '')).zip")

    Write-Host "ZIPファイルを解凍して、削除する。"
    Write-Host ".\OpenJDK8U-jdk_x64_windows_hotspot_$($version.Replace('-', '')).zip >>>> ."
    Expand-Archive -Path ".\OpenJDK8U-jdk_x64_windows_hotspot_$($version.Replace('-', '')).zip" -DestinationPath "." -Force
    Remove-Item ".\OpenJDK8U-jdk_x64_windows_hotspot_$($version.Replace('-', '')).zip"
}

Write-Host "環境変数を設定する"
$JAVA_HOME = Resolve-Path ".\jdk${version}"
Write-Host "JAVA_HOME = $JAVA_HOME"
[Environment]::SetEnvironmentVariable("JAVA_HOME", $JAVA_HOME, "User")
Write-Host "Pathに[%JAVA_HOME%\bin]を追加してください。"

Write-Host "何かキーを押してください。" -NoNewLine
[Console]::ReadKey() | Out-Null
