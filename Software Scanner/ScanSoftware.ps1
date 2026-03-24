Function Show-FoundSoftware(){

$category1 = "Web Browsers:"
$web1 = "Google Chrome"
$Cat1ArgList = '"{0}" "{1}"' -f $category1, $web1

$PC = $env:computername
Write-Host'                                                                ' -BackgroundColor White
Write-Host'     The following software is installed on: $PC                ' -ForegroundColor Blue -BackgroundColor White
Write-Host'            $Cat1ArgList                                        ' -ForegroundColor Green -BackgroundColor White
Write-Host'                                                                ' -BackgroundColor White
}


Function Show-NotDetecteddSoftware(){
$category1 = "Web Browsers:"
$web1 = "Google Chrome"

Write-Host '                                                                ' -BackgroundColor White
Write-Host ' The following software is NOT installed on $env:computername : ' -ForegroundColor Red -BackgroundColor White
Write-Host ' "Web Browser: $web1                                            ' -ForegroundColor Green -BackgroundColor White
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
