function init($version) {
    Write-Host "Node.js���_�E�����[�h����B"
    Write-Host "https://nodejs.org/dist/v${version}/node-v${version}-win-x64.zip"
    $client = new-object System.Net.WebClient
    $client.DownloadFile("https://nodejs.org/dist/v${version}/node-v${version}-win-x64.zip", ".\node-v${version}-win-x64.zip")

    If (!(test-path ".\node-v${version}-win-x64")) {
        Write-Host "ZIP�t�@�C�����𓀂��āA�폜����B"
        Write-Host ".\node-v${version}-win-x64 >>>> ."
        Expand-Archive -Path ".\node-v${version}-win-x64.zip" -DestinationPath "." -Force
        Remove-Item ".\node-v${version}-win-x64.zip"
    }

    Write-Host "���ϐ���ݒ肷��"
    $NODE_HOME = Resolve-Path ".\node-v${version}-win-x64"
    Write-Host "NODE_HOME = $NODE_HOME"
    [Environment]::SetEnvironmentVariable("NODE_HOME", $NODE_HOME, "User")
    Write-Host "Path��[%NODE_HOME%]��ǉ����Ă��������B"
}