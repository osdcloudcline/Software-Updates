Function Show-ScanSoftware {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string[]]$SoftwareNames
    )

    $AllSoftware = @()

    foreach ($SoftwareName in $SoftwareNames) {
        Write-Host "Checking $SoftwareName..." -ForegroundColor Cyan

        # Initialize status object for the current software
        $status = [ordered]@{
            Name             = $SoftwareName
            IsInstalled      = $false
            IsNotInstalled   = $true
            CurrentVersion   = "N/A"
            InstalledDetails = ""
        }

        switch ($SoftwareName) {

            # === Web Browser region ===
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
            } 

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

            # === Cloud Backup region ===
            "Dropbox" {
                $DropboxPATH = "C:\Program Files (x86)\Dropbox\Client"
                $DropboxEXE  = "C:\Program Files (x86)\Dropbox\Client\Dropbox.exe"
                
                $DropboxTP   = Test-Path -Path $DropboxEXE

                if ($DropboxTP) {
                    $FileVersion = (Get-Item $DropboxEXE).VersionInfo.ProductVersion
                    $status.IsInstalled      = $true
                    $status.IsNotInstalled   = $false
                    $status.CurrentVersion   = $FileVersion
                    $status.InstalledDetails = "Dropbox cloud backup is Installed at $DropboxPATH (Version: $FileVersion)"
                } else {
                    $status.IsInstalled      = $false
                    $status.IsNotInstalled   = $true
                    $status.InstalledDetails = "Dropbox cloud backup is NOT installed"
                }
            }

            # === Default Fallback ===
            # (Must always go at the very end of the switch block)
            Default {
                $status.InstalledDetails = "Software definition not found in script."
            }
        } # <-- Closes the switch statement

        # Convert hash table to an object for clean output and add to array
        $AllSoftware += [PSCustomObject]$status
    } # <-- Closes the foreach loop

    # Output the final results
    return $AllSoftware
}

# Define the array lists
$BrowserList = "Google Chrome", "Microsoft Edge", "Mozilla Firefox"
$CloudBackupList = "Dropbox"

# Run the function combining both lists
Show-ScanSoftware -SoftwareNames ($BrowserList + $CloudBackupList)
