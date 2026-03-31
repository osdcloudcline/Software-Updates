Function Show-ScanSoftware(){

$PC = $env:computername


 param([string]$SoftwareName)

 $status = @{
 Name = $SoftwareName
 IsNotInstalled = $false
 IsInstalled = $true
 CurrentVersion = $null
 }
}
switch ($SoftwareNames){
 "Google Chrome"{
 $ChromePATH = "C:\Program Files\Google\Chrome\Application"
 $GoogleEXE = "C:\Program Files\Google\Chrome\Application\chrome.exe"
 $GoogleTP = (Test-Path -Path $GoogleEXE -IsValid)
 $status.IsNotInstalled = $GoogleTP -eq $false
 $status.IsInstalled = $GoogleTP -eq $true
 $status.InstalledDetails = if ($status.IsInstalled) {
 $status.InstalledVersion = "Current Version: $($status.CurrentVersion)"
 "Google Chrome is Installed at $ChromePATH"} 
  elseif{
  ($status.IsNotInstalled) {"Google Chrome is NOT installed"}
 }
 }

}

# Scan software
$AllSoftware = @(){
 foreach ($SoftwareName in $SoftwareNames){
  Write-Host "Checking $SoftwareName..." -ForegroundColor Gray
  $status = Show-SoftwareScan $SoftwareName
  $AllSoftware += $status
}
}








Show-ScanSoftware
