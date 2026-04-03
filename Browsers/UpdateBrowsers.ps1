# Define the browsers in a simple list (Array of Objects)
$Browsers = @(
    @{ Name = "Google Chrome"; Path = $GoogleEXE; ID = "Google.Chrome" }
    @{ Name = "Mozilla Firefox"; Path = $FirefoxEXE; ID = "Mozilla.Firefox" }
    @{ Name = "Duck Duck Go"; Path = $DuckDuckGoEXE; ID = "DuckDuckGo.DesktopBrowser" }
)

$AnyFound = $false

foreach ($App in $Browsers) {
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
    Write-Warning "No third-party browsers are installed!"
}

$UpdateSoftwareMain = Invoke-WebRequest("https://github.com/osdcloudcline/Software-Updates/raw/refs/heads/main/UpdateSoftware.ps1")
Invoke-Expression $($UpdateSoftwareMain.Content)

