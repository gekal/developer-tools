Write-Host "ŠÂ‹«•Ï”‚ğİ’è‚·‚é"
$ANDROID_HOME = Resolve-Path ".\Sdk"
Write-Host "ANDROID_HOME = $ANDROID_HOME"
[Environment]::SetEnvironmentVariable("ANDROID_HOME", $ANDROID_HOME, "User")

Write-Host "‰½‚©ƒL[‚ğ‰Ÿ‚µ‚Ä‚­‚¾‚³‚¢B" -NoNewLine
[Console]::ReadKey() | Out-Null
