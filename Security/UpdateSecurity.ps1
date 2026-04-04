# Security file paths
      $MBAMEXE = "C:\Program Files\Adobe\Acrobat DC\Acrobat\ReaderMenuCoreApp.msix" 
      

# Define the security software in a simple list (Array of Objects)
$AntiMalware = @(
    @{ Name = "MalwareBytes Anti-Malware"; Path = $MBAMEXE; ID = "Malwarebytes.Malwarebytes" }
)

$AnyFound = $false

foreach ($App in $AntiMalware) {
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
    Write-Warning "No Anti-Malware software is installed!"
}
