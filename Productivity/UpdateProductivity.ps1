# Productivity file paths
      $AcrobatReaderEXE = "C:\Program Files\Adobe\Acrobat DC\Acrobat\ReaderMenuCoreApp.msix" 
      




# Define the productivity software in a simple list (Array of Objects)
$Productivity = @(
    @{ Name = "Adobe Acrobat Reader DC"; Path = $AcrobatReaderEXE; ID = "Adobe.Acrobat.Reader.64-bit" }
)

$AnyFound = $false

foreach ($App in $Productivity) {
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
    Write-Warning "No Adobe software is installed!"
}
