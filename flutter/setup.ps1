If (!(test-path ".\jdk-${version}")) {
    git clone -b stable https://github.com/flutter/flutter.git stable
}

Write-Host "環境変数を設定する"
$FLUTTER_HOME = Resolve-Path ".\stable"
Write-Host "FLUTTER_HOME = $FLUTTER_HOME"
[Environment]::SetEnvironmentVariable("FLUTTER_HOME", $FLUTTER_HOME, "User")
Write-Host "Pathに[%FLUTTER_HOME%\bin]を追加してください。"
Write-Host "Pathに[%LOCALAPPDATA%\Pub\Cache\bin]を追加してください。"

Write-Host "何かキーを押してください。" -NoNewLine
[Console]::ReadKey() | Out-Null
