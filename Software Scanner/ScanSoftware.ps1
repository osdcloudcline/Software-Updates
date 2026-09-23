Function Show-ScanSoftware {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string[]]$SoftwareNames
    )

    $AllSoftware = @()

    foreach ($SoftwareName in $SoftwareNames) {
        Write-Host "Checking $SoftwareName..." -ForegroundColor Cyan
        Write-Host

        # Initialize status object for the current software
        $status = [ordered]@{
            Name             = $SoftwareName
            IsInstalled      = $false
            IsNotInstalled   = $true
            CurrentVersion   = "N/A"
            InstalledDetails = ""
        }

        switch ($SoftwareName) {

        # Web Browser region
            "Google Chrome" {
                $ChromePATH = "C:\Program Files\Google\Chrome\Application"
                $GoogleEXE  = "C:\Program Files\Google\Chrome\Application\chrome.exe"
                
                $GoogleTP   = Test-Path -Path $GoogleEXE

                if ($GoogleTP) {
                    $FileVersion = (Get-Item $GoogleEXE).VersionInfo.ProductVersion
                    $status.IsInstalled      = $true
                    $status.IsNotInstalled   = $false
                    $status.CurrentVersion   = $FileVersion
                    $status.InstalledDetails = "Google Chrome is Installed at $ChromePATH (Version: $FileVersion)"
                } else {
                    $status.IsInstalled      = $false
                    $status.IsNotInstalled   = $true
                    $status.InstalledDetails = "Google Chrome is NOT installed"
                }
            } # <-- THIS CLOSING BRACKET WAS WRONG OR MISSING

            "Microsoft Edge" {
                $EdgePATH = "C:\Program Files (x86)\Microsoft\Edge\Application"
                $EdgeEXE  = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
                
                $EdgeTP   = Test-Path -Path $EdgeEXE

                if ($EdgeTP) {
                    $FileVersion = (Get-Item $EdgeEXE).VersionInfo.ProductVersion
                    $status.IsInstalled      = $true
                    $status.IsNotInstalled   = $false
                    $status.CurrentVersion   = $FileVersion
                    $status.InstalledDetails = "Microsoft Edge is Installed at $EdgePATH (Version: $FileVersion)"
                } else {
                    $status.IsInstalled      = $false
                    $status.IsNotInstalled   = $true
                    $status.InstalledDetails = "Microsoft Edge is NOT installed"
                }
            }

           "Mozilla Firefox" {
                $FirefoxPATH = "C:\Program Files\Mozilla Firefox"
                $FirefoxEXE  = "C:\Program Files\Mozilla Firefox\firefox.exe"
                
                $FirefoxTP   = Test-Path -Path $FirefoxEXE

                if ($FirefoxTP) {
                    $FileVersion = (Get-Item $FirefoxEXE).VersionInfo.ProductVersion
                    $status.IsInstalled      = $true
                    $status.IsNotInstalled   = $false
                    $status.CurrentVersion   = $FileVersion
                    $status.InstalledDetails = "Mozilla Firefox is Installed at $FirefoxPATH (Version: $FileVersion)"
                } else {
                    $status.IsInstalled      = $false
                    $status.IsNotInstalled   = $true
                    $status.InstalledDetails = "Mozilla Firefox is NOT installed"
                }
            }
            Default {
                $status.InstalledDetails = "Software definition not found in script."
            }

       # Cloud Backup region
        }

        # Convert hash table to an object for clean output and add to array
        $AllSoftware += [PSCustomObject]$status
    }

    # Output the final results
    return $AllSoftware
    
}

# Fix: Define the array of software names you want to check before running the function
$BrowserList = "Google Chrome", "Microsoft Edge", "Mozilla Firefox"

# Run the function
Show-ScanSoftware -SoftwareNames $BrowserList
