$version = "22.3.0"
$url = "https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${version}/graalvm-ce-java17-windows-amd64-${version}.zip"

Write-Host "jdk version: ${version}"
Write-Host "url: ${url}"

If (!(test-path ".\graalvm-ce-java17-${version}")) {
    $client = new-object System.Net.WebClient
    $client.DownloadFile("${url}", ".\graalvm-ce-java17-${version}.zip")

    Write-Host "ZIP�t�@�C�����𓀂��āA�폜����B"
    Write-Host ".\graalvm-ce-java17-${version}.zip >>>> ."
    Expand-Archive -Path ".\graalvm-ce-java17-${version}.zip" -DestinationPath "." -Force
    Remove-Item ".\graalvm-ce-java17-${version}.zip"
}

Write-Host "���ϐ���ݒ肷��"
$JAVA_HOME = Resolve-Path ".\graalvm-ce-java17-${version}"
Write-Host "JAVA_HOME = $JAVA_HOME"
[Environment]::SetEnvironmentVariable("JAVA_HOME", $JAVA_HOME, "User")
Write-Host "Path��[%JAVA_HOME%\bin]��ǉ����Ă��������B"

Write-Host "�����L�[�������Ă��������B" -NoNewLine
[Console]::ReadKey() | Out-Null
