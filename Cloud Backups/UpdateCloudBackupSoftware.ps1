
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
