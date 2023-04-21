If (!(test-path ".\jdk-${version}")) {
    git clone -b stable https://github.com/flutter/flutter.git stable
}

Write-Host "���ϐ���ݒ肷��"
$FLUTTER_HOME = Resolve-Path ".\stable"
Write-Host "FLUTTER_HOME = $FLUTTER_HOME"
[Environment]::SetEnvironmentVariable("FLUTTER_HOME", $FLUTTER_HOME, "User")
Write-Host "Path��[%FLUTTER_HOME%\bin]��ǉ����Ă��������B"
Write-Host "Path��[%LOCALAPPDATA%\Pub\Cache\bin]��ǉ����Ă��������B"

Write-Host "�����L�[�������Ă��������B" -NoNewLine
[Console]::ReadKey() | Out-Null
