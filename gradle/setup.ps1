$version = "7.5.1"

Write-Host "Gradle�t�@�C�����_�E�����[�h����B"
Write-Host "https://services.gradle.org/distributions/gradle-${version}-bin.zip"
$client = new-object System.Net.WebClient
$client.DownloadFile("https://services.gradle.org/distributions/gradle-${version}-bin.zip", ".\gradle-${version}-bin.zip")

Write-Host "ZIP�t�@�C�����𓀂��āA�폜����B"
Write-Host ".\gradle-${version}-bin.zip >>>> ."
Expand-Archive -Path ".\gradle-${version}-bin.zip" -DestinationPath "." -Force
Remove-Item ".\gradle-${version}-bin.zip"

Write-Host "���ϐ���ݒ肷��"
$GRADLE_HOME = Resolve-Path ".\gradle-${version}"
Write-Host "GRADLE_HOME = $GRADLE_HOME"
[Environment]::SetEnvironmentVariable("GRADLE_HOME", $GRADLE_HOME, "User")
Write-Host "Path��[%GRADLE_HOME%\bin]��ǉ����Ă��������B"

Write-Host "�����L�[�������Ă��������B" -NoNewLine
[Console]::ReadKey() | Out-Null
