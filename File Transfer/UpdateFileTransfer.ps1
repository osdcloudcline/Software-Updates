# File Transfer software file paths
      $FileZillaEXE = "C:\Program Files\FileZilla FTP Client\filezilla.exe" 
      $PuTTYEXE = "C:\Program Files\PuTTY\putty.exe"
      $WinSCPEXE = "C:\Program Files (x86)\WinSCP\WinSCP.exe"
     



# Define the file transfer software in a simple list (Array of Objects)
$WinGetFileTransfers = @(
    @{ Name = "PuTTY"; Path = $PuTTYEXE; ID = "PuTTY.PuTTY" }
    @{ Name = "WinSCP"; Path = $WinSCPEXE; ID = "WinSCP.WinSCP" }
    
)

$AnyFound = $false

foreach ($App in $WinGetFileTransfers) {
    if (Test-Path -Path $App.Path) {
        $AnyFound = $true
        Write-Host "$($App.Name) is installed on $env:computername at $($App.Path)" -ForegroundColor DarkBlue -BackgroundColor White
        Write-Host "`nProcessing updates for: $($App.Name)" -ForegroundColor Cyan
        
        winget upgrade --id $App.ID
        
        Write-Host "Completed: $($App.Name) update`n" -ForegroundColor Green
    } else {
        Write-Host "$($App.Name) is NOT installed on $env:computername" -ForegroundColor Red -BackgroundColor White
    }
}

if (-not $AnyFound) {
    Write-Warning "No file transfer utilities are installed!"
}

# Define the file transfer software in a simple list (Array of Objects)
$ChocolateyFileTransfers = @(
    @{ Name = "FileZilla FTP Client"; Path = $FileZillaEXE; ID = "filezilla" }
    
    
)

$AnyFound = $false

foreach ($App in $ChocolatetyFileTransfers) {
    if (Test-Path -Path $App.Path) {
        $AnyFound = $true
        Write-Host "$($App.Name) is installed on $env:computername at $($App.Path)" -ForegroundColor DarkBlue -BackgroundColor White
        Write-Host "`nProcessing updates for: $($App.Name)" -ForegroundColor Cyan
        
        choco upgrade $App.ID -y
        
        Write-Host "Completed: $($App.Name) update`n" -ForegroundColor Green
    } else {
        Write-Host "$($App.Name) is NOT installed on $env:computername" -ForegroundColor Red -BackgroundColor White
    }
}

if (-not $AnyFound) {
    Write-Warning "No file transfer utilities are installed!"
}
