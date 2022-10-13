function init($version) {
    
    If (!(test-path ".\python-${version}-embed-amd64")) {
        Write-Host "Python.jsをダウンロードする。"
        Write-Host "https://www.python.org/ftp/python/${version}/python-${version}-embed-amd64.zip"
        $client = new-object System.Net.WebClient
        $client.DownloadFile("https://www.python.org/ftp/python/${version}/python-${version}-embed-amd64.zip", ".\python-${version}-embed-amd64.zip")

        $client.DownloadFile("https://bootstrap.pypa.io/get-pip.py", ".\get-pip.py")

        Write-Host "ZIPファイルを解凍して、削除する。"
        Write-Host ".\python-${version}-embed-amd64 >>>> ."
        Expand-Archive -Path ".\python-${version}-embed-amd64.zip" -DestinationPath ".\python-${version}-embed-amd64" -Force
        Remove-Item ".\python-${version}-embed-amd64.zip"
    }

    Write-Host "環境変数を設定する"
    $PYTHON_HOME = Resolve-Path ".\python-${version}-embed-amd64"
    Write-Host "PYTHON_HOME = $PYTHON_HOME"
    [Environment]::SetEnvironmentVariable("PYTHON_HOME", $PYTHON_HOME, "User")
    Write-Host "Pathに[%PYTHON_HOME%]と[%PYTHON_HOME%\Scripts]を追加してください。"
}