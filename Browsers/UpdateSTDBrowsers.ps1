# Chrome Web Browser region

Function Show-GoogleChrome(){
$web1 = "Google Chrome"


$GoogleEXE = "C:\Program Files\Google\Chrome\Application\chrome.exe"

$GoogleTP = (Test-Path -Path $GoogleEXE -IsValid)

Write-Host "Scanning for: $GoogleEXE" -ForegroundColor Cyan
Write-Host
If($GoogleTP -eq $true){
Write-Host "$web1 is already installed on $env:computername" -ForegroundColor Red
Write-Host
Write-Host "Processing updates for: $web1" -ForegroundColor Cyan 
Write-Host
winget upgrade --id Google.Chrome
Write-Host "Completed: $web1 update" -ForegroundColor Green
Write-Host
}
elseif($GoogleTP -eq $false){
Write-Host "Google Chrome is NOT installed on $env:computername" -ForegroundColor Red
Write-Host
}
}

# Mozilla Firefox Web Browser region

Function Show-MozillaFirefox(){
$web2 = "Mozilla Firefox"


$FirefoxEXE = "C:\Program Files\Mozilla Firefox\firefox.exe"

$FirefoxTP = (Test-Path -Path $FirefoxEXE -IsValid)

Write-Host "Scanning for: $FirefoxEXE" -ForegroundColor Cyan
Write-Host
If($FirefoxeTP -eq $true){
Write-Host "$web2 is already installed on $env:computername" -ForegroundColor Red
Write-Host
Write-Host "Processing updates for: $web2" -ForegroundColor Cyan 
Write-Host
winget upgrade --id Mozilla.Firefox
Write-Host "Completed: $web2 update" -ForegroundColor Green
Write-Host
}
elseif($FirefoxTP -eq $false){
Write-Host "Mozilla Firefox is NOT installed on $env:computername" -ForegroundColor Red
Write-Host
}
}

Show-GoogleChrome
Show-MozillaFirefox

