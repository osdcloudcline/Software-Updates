Function Show-FoundSoftware(){
$web1 = "Google Chrome"

Write-Host '                                                            ' -BackgroundColor White
Write-Host ' The following software is installed on $env:computername : ' -ForegroundColor Blue -BackgroundColor White
Write-Host ' "Web Browser:" $web1                                       ' -ForegroundColor Green -BackgroundColor White
Write-Host '                                                            ' -BackgroundColor White
}


Function Show-NotDetecteddSoftware(){
$web1 = "Google Chrome"

Write-Host '                                                                ' -BackgroundColor White
Write-Host ' The following software is NOT installed on $env:computername : ' -ForegroundColor Red -BackgroundColor White
Write-Host ' "Web Browser:" $web1                                           ' -ForegroundColor Green -BackgroundColor White
Write-Host '                                                                ' -BackgroundColor White
}


Function Show-ScanSoftware(){

# Web Browsers region 

# Google Chrome region

$web1 = "Google Chrome"
$GoogleEXE = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$GoogleTP = (Test-Path -Path $GoogleEXE -IsValid)

If($GoogleTP -eq $true){
Show-FoundSoftware
}
elseif($GoogleTP -eq $false){
Show-NotDetectedSoftware 
}
}




Show-ScanSoftware
