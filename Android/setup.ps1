Write-Host "���ϐ���ݒ肷��"
$ANDROID_HOME = Resolve-Path ".\Sdk"
Write-Host "ANDROID_HOME = $ANDROID_HOME"
[Environment]::SetEnvironmentVariable("ANDROID_HOME", $ANDROID_HOME, "User")

Write-Host "�����L�[�������Ă��������B" -NoNewLine
[Console]::ReadKey() | Out-Null
