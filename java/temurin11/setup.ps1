$version = "11.0.16.1+1"
$url = "https://github.com/adoptium/temurin11-binaries/releases/download/jdk-${version}/OpenJDK11U-jdk_x64_windows_hotspot_$($version.Replace('+', '_')).zip"

Write-Host "jdk version: ${version}"
Write-Host "url: ${url}"

If (!(test-path ".\jdk-${version}")) {
    $client = new-object System.Net.WebClient
    $client.DownloadFile("${url}", ".\OpenJDK11U-jdk_x64_windows_hotspot_$($version.Replace('+', '_')).zip")

    Write-Host "ZIP�t�@�C�����𓀂��āA�폜����B"
    Write-Host ".\OpenJDK11U-jdk_x64_windows_hotspot_$($version.Replace('+', '_')).zip >>>> ."
    Expand-Archive -Path ".\OpenJDK11U-jdk_x64_windows_hotspot_$($version.Replace('+', '_')).zip" -DestinationPath "." -Force
    Remove-Item ".\OpenJDK11U-jdk_x64_windows_hotspot_$($version.Replace('+', '_')).zip"
}

Write-Host "���ϐ���ݒ肷��"
$JAVA_HOME = Resolve-Path ".\jdk-${version}"
Write-Host "JAVA_HOME = $JAVA_HOME"
[Environment]::SetEnvironmentVariable("JAVA_HOME", $JAVA_HOME, "User")
Write-Host "Path��[%JAVA_HOME%\bin]��ǉ����Ă��������B"

Write-Host "�����L�[�������Ă��������B" -NoNewLine
[Console]::ReadKey() | Out-Null
