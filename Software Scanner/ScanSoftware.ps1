Function Show-SoftwareSummary(){

$category1 = "Web Browsers:"
$web1 = "Google Chrome"
$web2 = "Mozilla Firefox"

$PC = $env:computername

Write-Host " **************************************************************** " -BackgroundColor White
Write-Host '                                                                  ' -BackgroundColor White
Write-Host  "The Current Windows hostname is:" "$PC"                            -ForegroundColor Blue -BackgroundColor White
Write-Host '                                                                  ' -BackgroundColor White
Write-Host '     The following software is installed:                         ' -ForegroundColor Blue -BackgroundColor White
Write-Host '                                                                  ' -ForegroundColor Green -BackgroundColor White
Write-Host '                                                                  ' -BackgroundColor White


$category1 = "Web Browsers:"
$web1 = "Google Chrome"
$web2 = "Mozilla Firefox"


Write-Host '                                                                 ' -BackgroundColor White
Write-Host  "The following software is NOT installed on $env:computername :   " -ForegroundColor Red -BackgroundColor White
Write-Host  "Web Browser: $web1                                              " -ForegroundColor Green -BackgroundColor White
Write-Host '                                                                 ' -BackgroundColor White
}


Function Get-SoftwareScan {
 param([string]$SoftwareScan

 $status = @{
 Name = $SoftwareScan
 IsNotInstalled = $false
 IsInstalled = $true
 }

switch ($SoftwareScan){
 "Google Chrome"{
 }
 

Function Show-ScanSoftware(){

#Software to Scan

$SoftwareScan = @(
"Google Chrome",
"Mozilla Firefox",
"DuckDuck Go",
"DropBox",
"Google Cloud - GDrive",
"NextCloud Desktop Client",
"Microsoft OneDrive",
"Apple iCloud",
"Custom UPBR",
"Docker Desktop",
"GitHub Desktop",
"FileZilla",
"PuTTY",
"WinSCP",
"Steam",
"Audacity",
"FFMPEG",
"GIMP",
"Handbrake",
"Kodi",
"MKVToolNix",
"MakeMKV",
"MediaInfo",
"Logitech My Harmony",
"PowerISO",
"VLC Player",
"iTunes",
"Acrobat Reader",
"AI Cursor Editor",
"Visual Studio 2026 Enterprise",
"VS Code",
"Crucial Storage",
"Logitech Options",
"Logitech Unifying Receiver Software",
"Microsoft Mouse and Keyboard",
"Samsung Magician",
"Western Digital SSD",
"7-Zip",
"CCleaner",
"Display Driver Uninstaller",
"Smart Defrag",
"Wise Registry Cleaner",
"Any Desk Remote Desktop VDI Client",
"Microsoft Remote Desktop",
"VMWare Horizon",
"VMWare Workstation Pro"
)

# Scan software
$AllSoftware = @()
 foreach ($SoftwareName in $SoftwareScan){
  Write-Host "Checking $SoftwareName..." -ForegroundColor Gray
  $status = Get-SoftwareScan $SoftwareName
  $AllSoftware += $status

# Web Browsers region 

# Google Chrome region

$web1 = "Google Chrome"
$GoogleEXE = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$GoogleTP = (Test-Path -Path $GoogleEXE -IsValid)

# Firefox region

$web2 = "Mozilla Firefox"
$FirefoxEXE = ""
$FirefoxTP = ""

If($GoogleTP -eq $true) -and ($FirefoxTP -eq $true){
Show-SoftwareSummary
}
elseif($GoogleTP -eq $false){
Show-NotDetectedSoftware 
}
}




Show-ScanSoftware
