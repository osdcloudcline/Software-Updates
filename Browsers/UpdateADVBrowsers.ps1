
# Web Browser variables region

$web1 = "Google Chrome"


$GoogleEXE = "C:\Program Files\Google\Chrome\Application\chrome.exe"

$GoogleTP = (Test-Path -Path $GoogleEXE -IsValid)

Write-Host "Scanning for: $GoogleEXE" -ForegroundColor Cyan

If($GoogleTP -eq $true){
Write-Host "Processing updates for: $web1" -ForegroundColor Cyan 
winget upgrade --id Google.Chrome
Write-Host "Completed: $web1 update" -ForegroundColor Green
}
elseif($GoogleTP -eq $false){
Write-Host "Processing: $web1 installation" -ForegroundColor Cyan
winget install --id Google.Chrome
Write-Host "Completed: $web1 installation" -ForegroundColor Green
}
