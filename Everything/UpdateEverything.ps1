# Browser file paths
      $EdgeEXE = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" 
      $GoogleEXE = "C:\Program Files\Google\Chrome\Application\chrome.exe"
      $FirefoxEXE = "C:\Program Files\Mozilla Firefox\firefox.exe"
      $DuckDuckGoEXE = "C:\Program Files\WindowsApps\DuckDuckGo.DesktopBrowser_0.150.1.0_x64__ya2fgkz3nks94\WindowsBrowser\DuckDuckGo.exe"



# Define the browsers in a simple list (Array of Objects)
$Browsers = @(
    @{ Name = "Microsoft Edge"; Path = $EdgeEXE; ID = "Microsoft.Edge " }
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


$DropboxEXE = "C:\Program Files (x86)\Dropbox\Client\Dropbox.exe"
$OneDriveEXE = "C:\Program Files\Microsoft OneDrive\OneDrive.exe"
$GDriveEXE = "C:\Program Files\Google\Drive\googledrivesync.exe"
$NextCloudEXE = "C:\Program Files\Nextcloud\nextcloud.exe"
$iCloudEXE = "C:\Program Files\Common Files\Apple\Internet Services\iCloud.exe"


# Define the cloud services in a simple list (Array of Objects)
$CloudServices = @(
    @{ Name = "DropBox"; Path = $DropBoxEXE; ID = "Dropbox.Dropbox" }
    @{ Name = "Microsoft OneDrive"; Path = $OneDriveEXE; ID = "Microsoft.OneDrive" }
    @{ Name = "Google Drive"; Path = $GDriveEXE; ID = "Google.GoogleDrive" }
    @{ Name = "Next Cloud Client"; Path = $NextCloudEXE; ID = "Nextcloud.NextcloudDesktop" }
    @{ Name = "Apple iCloud"; Path = $iCloudEXE; ID = "Apple.iCloud" }
    
)

$AnyFound = $false

foreach ($App in $CloudServices) {
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
    Write-Warning "No Cloud Service solutions are installed!"
}

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
