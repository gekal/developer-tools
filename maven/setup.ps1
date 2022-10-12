$version = "3.8.6"

Write-Host "Maven�t�@�C�����_�E�����[�h����B"
Write-Host "https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/${version}/apache-maven-${version}-bin.zip"
$client = new-object System.Net.WebClient
$client.DownloadFile("https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/${version}/apache-maven-${version}-bin.zip", ".\apache-maven-${version}-bin.zip")

Write-Host "ZIP�t�@�C�����𓀂��āA�폜����B"
Write-Host ".\apache-maven-${version}-bin.zip >>>> ."
Expand-Archive -Path ".\apache-maven-${version}-bin.zip" -DestinationPath "." -Force
Remove-Item ".\apache-maven-${version}-bin.zip"

Write-Host "���ϐ���ݒ肷��"
$MAVEN_HOME = Resolve-Path ".\apache-maven-${version}"
Write-Host "MAVEN_HOME = $MAVEN_HOME"
[Environment]::SetEnvironmentVariable("MAVEN_HOME", $MAVEN_HOME, "User")
Write-Host "Path��[%MAVEN_HOME%\bin]��ǉ����Ă��������B"

Write-Host "�����L�[�������Ă��������B" -NoNewLine
[Console]::ReadKey() | Out-Null
