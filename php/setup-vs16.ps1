function init($version) {

    If (!(test-path ".\php-${version}-nts-Win32-vs16-x64")) {
        Write-Host "PHPをダウンロードする。"
        Write-Host "https://windows.php.net/downloads/releases/php-${version}-nts-Win32-vs16-x64.zip"
        $client = new-object System.Net.WebClient
        $client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
        $client.DownloadFile("https://windows.php.net/downloads/releases/php-${version}-nts-Win32-vs16-x64.zip", ".\php-${version}-nts-Win32-vs16-x64.zip")

        Write-Host "ZIPファイルを解凍して、削除する。"
        Write-Host ".\php-${version}-nts-Win32-vs16-x64 >>>> ."
        Expand-Archive -Path ".\php-${version}-nts-Win32-vs16-x64.zip" -DestinationPath ".\php-${version}-nts-Win32-vs16-x64" -Force
        Remove-Item ".\php-${version}-nts-Win32-vs16-x64.zip"
    }

    Write-Host "環境変数を設定する"
    $PHP_HOME = Resolve-Path ".\php-${version}-nts-Win32-vs16-x64"
    Write-Host "PHP_HOME = $PHP_HOME"
    [Environment]::SetEnvironmentVariable("PHP_HOME", $PHP_HOME, "User")
    Write-Host "Pathに[%PHP_HOME%]を追加してください。"
}