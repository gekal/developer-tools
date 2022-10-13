function init($version) {
    
    If (!(test-path ".\python-${version}-embed-amd64")) {
        Write-Host "Python.js���_�E�����[�h����B"
        Write-Host "https://www.python.org/ftp/python/${version}/python-${version}-embed-amd64.zip"
        $client = new-object System.Net.WebClient
        $client.DownloadFile("https://www.python.org/ftp/python/${version}/python-${version}-embed-amd64.zip", ".\python-${version}-embed-amd64.zip")

        $client.DownloadFile("https://bootstrap.pypa.io/get-pip.py", ".\get-pip.py")

        Write-Host "ZIP�t�@�C�����𓀂��āA�폜����B"
        Write-Host ".\python-${version}-embed-amd64 >>>> ."
        Expand-Archive -Path ".\python-${version}-embed-amd64.zip" -DestinationPath ".\python-${version}-embed-amd64" -Force
        Remove-Item ".\python-${version}-embed-amd64.zip"
    }

    Write-Host "���ϐ���ݒ肷��"
    $PYTHON_HOME = Resolve-Path ".\python-${version}-embed-amd64"
    Write-Host "PYTHON_HOME = $PYTHON_HOME"
    [Environment]::SetEnvironmentVariable("PYTHON_HOME", $PYTHON_HOME, "User")
    Write-Host "Path��[%PYTHON_HOME%]��[%PYTHON_HOME%\Scripts]��ǉ����Ă��������B"
}