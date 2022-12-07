$version = "8u345-b01"
$url = "https://github.com/adoptium/temurin8-binaries/releases/download/jdk${version}/OpenJDK8U-jdk_x64_windows_hotspot_$($version.Replace('-', '')).zip"

Write-Host "jdk version: ${version}"
Write-Host "url: ${url}"

If (!(test-path ".\jdk${version}")) {
    $client = new-object System.Net.WebClient
    $client.DownloadFile("${url}", ".\OpenJDK8U-jdk_x64_windows_hotspot_$($version.Replace('-', '')).zip")

    Write-Host "ZIP�t�@�C�����𓀂��āA�폜����B"
    Write-Host ".\OpenJDK8U-jdk_x64_windows_hotspot_$($version.Replace('-', '')).zip >>>> ."
    Expand-Archive -Path ".\OpenJDK8U-jdk_x64_windows_hotspot_$($version.Replace('-', '')).zip" -DestinationPath "." -Force
    Remove-Item ".\OpenJDK8U-jdk_x64_windows_hotspot_$($version.Replace('-', '')).zip"
}

Write-Host "���ϐ���ݒ肷��"
$JAVA_HOME = Resolve-Path ".\jdk${version}"
Write-Host "JAVA_HOME = $JAVA_HOME"
[Environment]::SetEnvironmentVariable("JAVA_HOME", $JAVA_HOME, "User")
Write-Host "Path��[%JAVA_HOME%\bin]��ǉ����Ă��������B"

Write-Host "�����L�[�������Ă��������B" -NoNewLine
[Console]::ReadKey() | Out-Null
