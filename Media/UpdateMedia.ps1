# Media file paths
      $Audacity1EXE = "C:\Program Files\Audacity\audacity.exe" 
      $Audacity2EXE = "C:\Program Files (x86)\Audacity\\audacity.exe" 
      $FFMPEGEXE = "C:\Users\$env:username\Downloads\ffmpeg-master-latest-win64-gpl-shared\bin\ffmpeg.exe"
      $GIMPEXE = "C:\Program Files\GIMP 2\bin\gimp-2.10.exe"
      $GIMPUserEXE = "C:\Users\$env:username\AppData\Local\Programs\GIMP 3\bin\gimp-3.exe"
      $HandbrakeEXE = "C:\Program Files\HandBrake\HandBrake.exe"
      $KODIEXE = "C:\Program Files\Kodi\kodi.exe"
      $MKVToolNixEXE = "C:\Program Files\MKVToolNix\mkvtoolnix-gui.exe"




# Define the gaming software in a simple list (Array of Objects)
$Media = @(
    @{ Name = "Audacity"; Path = $Audacity1EXE; ID = "Audacity.Audacity" }
    @{ Name = "Audacity"; Path = $Audacity2EXE; ID = "Audacity.Audacity" }
    @{ Name = "FFMPEG"; Path = $FFMPEGEXE; ID = "Gyan.FFmpeg" }
    @{ Name = "GIMP 2.10.38"; Path = $GIMPEXE; ID = "GIMP.GIMP.2" }
    @{ Name = "GIMP 3.2.2.0"; Path = $GIMPUserEXE; ID = "GIMP.GIMP.3" }
    @{ Name = "Handbrake Media Encoder"; Path = $HandbrakeEXE; ID = "HandBrake.HandBrake" }
    @{ Name = "KODI Media Software Suite"; Path = $KODIEXE; ID = "XBMCFoundation.Kodi" }
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
