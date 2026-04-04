$DockerDesktopEXE = "C:\Program Files\Docker\Docker\Docker Desktop.exe"
$GitHubDesktopEXE = "C:\Program Files (x86)\GitHub Desktop Installer\desktop.exe"



# Define the development tools in a simple list (Array of Objects)
$DevTools = @(
    @{ Name = "Docker Desktop"; Path = $DockerDesktopEXE; ID = "Docker.DockerDesktop" }
    @{ Name = "GitHub Desktop"; Path = $OneDriveEXE; ID = "GitHub.GitHubDesktop" }
   
    
)

$AnyFound = $false

foreach ($App in $DevTools) {
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
    Write-Warning "No Dev Tools solutions are installed!"
}
