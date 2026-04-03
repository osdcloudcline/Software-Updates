# Browser file paths
      $GoogleEXE = "C:\Program Files\Google\Chrome\Application\chrome.exe"
      $FirefoxEXE = "C:\Program Files\Mozilla Firefox\firefox.exe"
      $DuckDuckGoEXE = "C:\Program Files\WindowsApps\DuckDuckGo.DesktopBrowser_0.150.1.0_x64__ya2fgkz3nks94\WindowsBrowser\DuckDuckGo.exe"



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


$SoftwareUpdatesMain = Invoke-WebRequest("https://github.com/osdcloudcline/Software-Updates/raw/refs/heads/main/UpdateSoftware.ps1")
Invoke-Expression $($SoftwareUpdatesMain.Content)
