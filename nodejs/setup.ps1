function init($version) {
    Write-Host "Node.jsをダウンロードする。"
    Write-Host "https://nodejs.org/dist/v${version}/node-v${version}-win-x64.zip"
    $client = new-object System.Net.WebClient
    $client.DownloadFile("https://nodejs.org/dist/v${version}/node-v${version}-win-x64.zip", ".\node-v${version}-win-x64.zip")

    If (!(test-path ".\node-v${version}-win-x64")) {
        Write-Host "ZIPファイルを解凍して、削除する。"
        Write-Host ".\node-v${version}-win-x64 >>>> ."
        Expand-Archive -Path ".\node-v${version}-win-x64.zip" -DestinationPath "." -Force
        Remove-Item ".\node-v${version}-win-x64.zip"
    }

    Write-Host "環境変数を設定する"
    $NODE_HOME = Resolve-Path ".\node-v${version}-win-x64"
    Write-Host "NODE_HOME = $NODE_HOME"
    [Environment]::SetEnvironmentVariable("NODE_HOME", $NODE_HOME, "User")
    Write-Host "Pathに[%NODE_HOME%]を追加してください。"
}