Set-Location -Path $PSScriptRoot

if (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {  
    try {
        # choco command check
        Get-Command -CommandType Application -Name choco
        Write-Host "checoがインストールされた。"
    }
    catch {
        Write-Host "checoをインストールします。"
        # Chocolatey Install
        Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    }

    # install packages
    choco install .\packages.config -y
}else {
    Write-Host "権限がありません。"
}

Write-Host "何かキーを押してください。" -NoNewLine
[Console]::ReadKey() | Out-Null
