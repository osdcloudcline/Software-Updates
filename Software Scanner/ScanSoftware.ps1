Function Show-FoundSoftware(){
$q = '"'
$web1 = "Google Chrome"
$browser1 = $q + $web1 + $q

$PC = $env:computername
Write-Host '                                                            ' -BackgroundColor White
Write-Host " The following software is installed on: $PC"                 -ForegroundColor Blue -BackgroundColor White
Write-Host    $browser1                                                   -ForegroundColor Green -BackgroundColor White
Write-Host '                                                            ' -BackgroundColor White
}


Function Show-NotDetecteddSoftware(){
$web1 = "Google Chrome"

Write-Host '                                                                ' -BackgroundColor White
Write-Host ' The following software is NOT installed on $env:computername : ' -ForegroundColor Red -BackgroundColor White
Write-Host ' "Web Browser: $web1                                           "' -ForegroundColor Green -BackgroundColor White
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
