# Gaming file paths
      $SteamEXE = "C:\Program Files (x86)\Steam\steam.exe" 
      $OriginEXE = "C:\Program Files (x86)\Origin\Origin.exe"
      $EpicGamesLauncherEXE = "C:\Program Files (x86)\Epic Games\Launcher\Portal\Binaries\Win64\EpicGamesLauncher.exe"




# Define the gaming software in a simple list (Array of Objects)
$Gaming = @(
    @{ Name = "Steam Gaming Platform Client"; Path = $SteamEXE; ID = "Valve.Steam" }
    @{ Name = "EA Origin Gaming Platform"; Path = $OriginEXE; ID = "ElectronicArts.Origin" }
    @{ Name = "Epic Games Launcher"; Path = $EpicGamesLauncherEXE; ID = "EpicGames.EpicGamesLauncher" }
    
)

$AnyFound = $false

foreach ($App in $Gaming) {
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
    Write-Warning "No gaming software are installed!"
}
