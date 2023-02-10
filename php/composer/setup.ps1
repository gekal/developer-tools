function init($version) {

    If (!(test-path ".\composer.phar")) {
        Write-Host "Composer���_�E�����[�h����B"
        Write-Host "https://getcomposer.org/download/${version}/composer.phar"
        $client = new-object System.Net.WebClient
        $client.DownloadFile("https://getcomposer.org/download/${version}/composer.phar", ".\composer.phar")
    }

    Set-Content -Path '.\composer.bat' -Value '@php "%~dp0composer.phar" %*'

    Write-Host "���ϐ���ݒ肷��"
    $COMPOSER_HOME = Resolve-Path "."
    Write-Host "COMPOSER_HOME = $COMPOSER_HOME"
    [Environment]::SetEnvironmentVariable("COMPOSER_HOME", $COMPOSER_HOME, "User")

    Write-Host "Path��[%COMPOSER_HOME%]��ǉ����Ă��������B"
}