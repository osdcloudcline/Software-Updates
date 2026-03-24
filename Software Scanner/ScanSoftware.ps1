$PC = $env:computername




Function Get-SoftwareScan {
 param([string]$SoftwareScan

 $status = @{
 Name = $SoftwareScan
 IsNotInstalled = $false
 IsInstalled = $true
 }
 }
switch ($SoftwareScan){
 "Google Chrome"{
 $GoogleEXE = "C:\Program Files\Google\Chrome\Application\chrome.exe"
 $GoogleTP = (Test-Path -Path $GoogleEXE -IsValid)
 $status.IsNotInstalled = $GoogleTP -eq $false
 $status.IsInstalled = $GoogleTP -eq $true
 $status.Details = if ($status.IsInstalled) {"Google Chrome is Installed"} else ($status.IsNotInstalled) {"Google Chrome is NOT installed"}
 }
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
}

# Scan software
$AllSoftware = @()
 foreach ($SoftwareName in $SoftwareScan){
  Write-Host "Checking $SoftwareName..." -ForegroundColor Gray
  $status = Get-SoftwareScan $SoftwareName
  $AllSoftware += $status


Write-Host ""
Write-Host "+=======================================================================+" -ForegroundColor Cyan
Write-Host "|                        SOFTWARE SCAN RESULTS                      |    " -ForegroundColor Cyan  
Write-Host "+=======================================================================+" -ForegroundColor Cyan
Write-Host ""

# Show what's already installed
if ($InstalledItems.Count -gt 0) {
    Write-Host "ALREADY INSTALLED:" -ForegroundColor Green
    Write-Host "-----------------" -ForegroundColor Green
    foreach ($item in $InstalledItems) {
        Write-Status "$($item.Name) - $($item.Details)" "INSTALLED"
    }
    Write-Host ""
}
}





Show-ScanSoftware
