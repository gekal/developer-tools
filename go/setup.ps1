function init($version) {
    
    If (!(test-path ".\go${version}.windows-amd64")) {
        Write-Host "GO���_�E�����[�h����B"
        Write-Host "https://dl.google.com/go//go${version}.windows-amd64.zip"
        $client = new-object System.Net.WebClient
        $client.DownloadFile("https://dl.google.com/go//go${version}.windows-amd64.zip", ".\go${version}.windows-amd64.zip")

        Write-Host "ZIP�t�@�C�����𓀂��āA�폜����B"
        Write-Host ".\go${version}.windows-amd64 >>>> ."
        Expand-Archive -Path ".\go${version}.windows-amd64.zip" -DestinationPath ".\go${version}.windows-amd64" -Force
        Remove-Item ".\go${version}.windows-amd64.zip"
    }

    Write-Host "���ϐ���ݒ肷��"
    $GO_HOME = Resolve-Path ".\go${version}.windows-amd64\go"
    Write-Host "GO_HOME = $GO_HOME"
    [Environment]::SetEnvironmentVariable("GO_HOME", $GO_HOME, "User")
    Write-Host "Path��[%GO_HOME%\bin]��ǉ����Ă��������B"
}