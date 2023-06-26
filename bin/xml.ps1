Param(
    [Parameter(Mandatory=$true, Position = 0)]
    [Alias('I')]
    [string]$InputPath,
    [Alias('O')]
    [string]$OutputPath,
    [Parameter(Mandatory=$false)]
    [Alias('C')]
    [switch]$Compression,
    [int]$Indent=4
)

if (![System.IO.File]::Exists($InputPath)) {
    Write-Host "Input path is not exit.[${InputPath}]";
    exit;
}

if ([string]::IsNullOrWhiteSpace($OutputPath)) {
    $FileName = [System.IO.Path]::GetFileNameWithoutExtension($InputPath);
    $DirectoryName = [System.IO.Path]::GetDirectoryName($InputPath);
    $Extension = [System.IO.Path]::GetExtension($InputPath);
    $OutputPath = "${DirectoryName}\${FileName}-out${Extension}";
}

$Settings = New-Object System.Xml.XmlWriterSettings;
$Settings.Indent = $true;
$Settings.Encoding = New-Object System.Text.UTF8Encoding($true);
if ($Compression) {
    $Settings.IndentChars = [string]::Empty;
    $Settings.NewLineChars = [string]::Empty;
} else {
    $Settings.IndentChars = [string]::Empty.PadLeft($Indent, " ");
    $Settings.NewLineChars = "`r`n";
}

$writer = [System.Xml.XmlWriter]::Create($OutputPath, $Settings);
try{
    $xml = [xml](get-content $InputPath);
    $xml.Save($writer);
} finally{
    $writer.Dispose();
}
