function init($version) {

    If (!(test-path ".\composer.phar")) {
        Write-Host "Composerをダウンロードする。"
        Write-Host "https://getcomposer.org/download/${version}/composer.phar"
        $client = new-object System.Net.WebClient
        $client.DownloadFile("https://getcomposer.org/download/${version}/composer.phar", ".\composer.phar")
    }

    Set-Content -Path '.\composer.bat' -Value '@php "%~dp0composer.phar" %*'

    Write-Host "環境変数を設定する"
    $COMPOSER_HOME = Resolve-Path "."
    Write-Host "COMPOSER_HOME = $COMPOSER_HOME"
    [Environment]::SetEnvironmentVariable("COMPOSER_HOME", $COMPOSER_HOME, "User")

    Write-Host "Pathに[%COMPOSER_HOME%]を追加してください。"
}