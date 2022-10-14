function init($version) {
    
    If (!(test-path ".\go${version}.windows-amd64")) {
        Write-Host "GOをダウンロードする。"
        Write-Host "https://dl.google.com/go//go${version}.windows-amd64.zip"
        $client = new-object System.Net.WebClient
        $client.DownloadFile("https://dl.google.com/go//go${version}.windows-amd64.zip", ".\go${version}.windows-amd64.zip")

        Write-Host "ZIPファイルを解凍して、削除する。"
        Write-Host ".\go${version}.windows-amd64 >>>> ."
        Expand-Archive -Path ".\go${version}.windows-amd64.zip" -DestinationPath ".\go${version}.windows-amd64" -Force
        Remove-Item ".\go${version}.windows-amd64.zip"
    }

    Write-Host "環境変数を設定する"
    $GO_HOME = Resolve-Path ".\go${version}.windows-amd64\go"
    Write-Host "GO_HOME = $GO_HOME"
    [Environment]::SetEnvironmentVariable("GO_HOME", $GO_HOME, "User")
    Write-Host "Pathに[%GO_HOME%\bin]を追加してください。"
}