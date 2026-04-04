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

# Media file paths
      $Audacity1EXE = "C:\Program Files\Audacity\audacity.exe" 
      $Audacity2EXE = "C:\Program Files (x86)\Audacity\\audacity.exe" 
      $FFMPEGEXE = "C:\Users\$env:username\Downloads\ffmpeg-master-latest-win64-gpl-shared\bin\ffmpeg.exe"
      $GIMPEXE = "C:\Program Files\GIMP 2\bin\gimp-2.10.exe"
      $GIMPUserEXE = "C:\Users\$env:username\AppData\Local\Programs\GIMP 3\bin\gimp-3.exe"
      $HandbrakeEXE = "C:\Program Files\HandBrake\HandBrake.exe"
      $KODIEXE = "C:\Program Files\Kodi\kodi.exe"
      $MKVToolNixEXE = "C:\Program Files\MKVToolNix\mkvtoolnix-gui.exe"
      $MakeMKVEXE = "C:\Program Files (x86)\MakeMKV\makemkv.exe"
      $MediaInfo1EXE = "C:\Program Files\MediaInfo\MediaInfo.exe"
      $MediaInfo2EXE = "C:\Program Files (x86)\MediaInfo\MediaInfo.exe"
      $LogitechMyHarmonyEXE = "C:\Program Files (x86)\Logitech\MyHarmony\MyHarmonyLauncher.exe"
      $PowerISOEXE = "C:\Program Files\PowerISO\poweriso.exe"
      $VLCPlayerEXE = "C:\Program Files\VideoLAN\VLC\vlc.exe"
      $iTunesEXE = "C:\Program Files\iTunes\iTunes.exe"




# Define the gaming software in a simple list (Array of Objects)
$Media = @(
    @{ Name = "Audacity"; Path = $Audacity1EXE; ID = "Audacity.Audacity" }
    @{ Name = "Audacity"; Path = $Audacity2EXE; ID = "Audacity.Audacity" }
    @{ Name = "FFMPEG"; Path = $FFMPEGEXE; ID = "Gyan.FFmpeg" }
    @{ Name = "GIMP 2.10.38"; Path = $GIMPEXE; ID = "GIMP.GIMP.2" }
    @{ Name = "GIMP 3.2.2.0"; Path = $GIMPUserEXE; ID = "GIMP.GIMP.3" }
    @{ Name = "Handbrake Media Encoder"; Path = $HandbrakeEXE; ID = "HandBrake.HandBrake" }
    @{ Name = "KODI Media Software Suite"; Path = $KODIEXE; ID = "XBMCFoundation.Kodi" }
    @{ Name = "MKV ToolNix"; Path = $MKVToolNixEXE; ID = "MoritzBunkus.MKVToolNix" }
    @{ Name = "MakeMKV"; Path = $MakeMKVEXE; ID = "GuinpinSoft.MakeMKV" }
    @{ Name = "MediaInfo"; Path = $MediaInfo1EXE; ID = "MediaArea.MediaInfo.GUI" }
    @{ Name = "MediaInfo"; Path = $MediaInfo2EXE; ID = "MediaArea.MediaInfo.GUI" }
    @{ Name = "Logitech MyHarmony Remote Universal Remote Control"; Path = $LogitechMyHarmonyEXE; ID = "Logitech.MyHarmony" }
    @{ Name = "PowerISO"; Path = $PowerISOEXE; ID = "PowerSoftware.PowerISO" }
    @{ Name = "VLC Media Player"; Path = $VLCPlayerEXE; ID = "VideoLAN.VLC" }
    @{ Name = "Apple iTunes"; Path = $iTunesEXE; ID = "Apple.iTunes" }
)

$AnyFound = $false

foreach ($App in $Media) {
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
    Write-Warning "No media software is installed!"
}

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

# Programming file paths
      $AICursorEditorEXE = "C:\Users\$env:username\AppData\Local\Programs\cursor\Cursor.exe" 
      $VSCode1EXE = "C:\Program Files\Microsoft VS Code\Code.exe"
      $VSCode2EXE = ""C:\Users\$env:username\AppData\Local\Programs\Microsoft VS Code\Code.exe"
      $VS2026EXE = "C:\Program Files\Microsoft Visual Studio\2026\Enterprise\Common7\IDE\devenv.exe"
      




# Define the programming software in a simple list (Array of Objects)
$Programming = @(
    @{ Name = "AI Cursor Editor"; Path = $AICursorEditorEXE; ID = "Anysphere.Cursor" }
    @{ Name = "Microsoft Visual Studio Code"; Path = $VSCode1EXE; ID = "Microsoft.VisualStudioCode" }
    @{ Name = "Microsoft Visual Studio Code"; Path = $VSCode1EXE; ID = "Microsoft.VisualStudioCode" }
    @{ Name = "Microsoft Visual Studio 2026"; Path = $VS2026EXE; ID = "Microsoft.VisualStudio.Enterprise" }
)

$AnyFound = $false

foreach ($App in $Programming) {
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
    Write-Warning "No Programming software is installed!"
}
