Param(
    [Parameter(Mandatory=$false)]
    [Alias('D')]
    [switch]$Decode,
    [Parameter(Mandatory=$true, Position = 0)]
    [string]$InputString
)

if($Decode) {
    try {
        $bytes = [System.Convert]::FromBase64String($InputString);
        $txt = [System.Text.Encoding]::Default.GetString($bytes);
        Write-Host $txt;
    } catch {
        Write-Error "Can not decode base64 string for [${InputString}].";
    }
} else {
    $bytes = ([System.Text.Encoding]::Default).GetBytes($InputString);
    $b64enc = [Convert]::ToBase64String($bytes);
    Write-Host $b64enc;
}
