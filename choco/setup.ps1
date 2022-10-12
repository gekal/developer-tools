Set-Location -Path $PSScriptRoot

if (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {  
    try {
        # choco command check
        Get-Command -CommandType Application -Name choco
        Write-Host "checo���C���X�g�[�����ꂽ�B"
    }
    catch {
        Write-Host "checo���C���X�g�[�����܂��B"
        # Chocolatey Install
        Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    }

    # install packages
    choco install .\packages.config -y
}else {
    Write-Host "����������܂���B"
}

Write-Host "�����L�[�������Ă��������B" -NoNewLine
[Console]::ReadKey() | Out-Null
