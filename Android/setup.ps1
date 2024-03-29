if(!(Test-Path -Path ".\Sdk" )) {
    New-Item -ItemType Directory -Path ".\Sdk"
}

Write-Host "環境変数を設定する"
$ANDROID_HOME = Resolve-Path ".\Sdk"
Write-Host "ANDROID_HOME = $ANDROID_HOME"
[Environment]::SetEnvironmentVariable("ANDROID_HOME", $ANDROID_HOME, "User")

Write-Host "何かキーを押してください。" -NoNewLine
[Console]::ReadKey() | Out-Null
