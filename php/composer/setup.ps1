function init($version) {

    If (!(test-path ".\composer.phar")) {
        Write-Host "Composerをダウンロードする。"
        Write-Host "https://getcomposer.org/download/${version}/composer.phar"
        $client = new-object System.Net.WebClient
        $client.DownloadFile("https://getcomposer.org/download/${version}/composer.phar", ".\composer.phar")
    }

    Write-Host ""
}