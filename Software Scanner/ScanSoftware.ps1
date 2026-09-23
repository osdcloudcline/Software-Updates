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
            GPOSetting       = "N/A" # Added default value so object properties align
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
                    $status.InstalledDetails = "Dropbox Cloud Backup is Installed at $DropboxPATH (Version: $FileVersion)"
                } else {
                    $status.IsInstalled      = $false
                    $status.IsNotInstalled   = $true
                    $status.InstalledDetails = "Dropbox Cloud Backup is NOT installed"
                }
            }

            "Microsoft OneDrive" { # <-- Fixed to match the exact string in your array list
                $OneDrivePATH = "C:\Program Files\Microsoft OneDrive"
                $OneDriveEXE  = "C:\Program Files\Microsoft OneDrive\OneDrive.exe"
                
                # Check for the executable first
                $OneDriveTP   = Test-Path -Path $OneDriveEXE
                
                # Query the modern Group Policy registry key
                $path = "HKLM:\SOFTWARE\Policies\Microsoft\OneDrive"
                $OneDriveTypepath = Test-Path -Path $path # <-- Moved AFTER defining $path
                
                $ring = $null
                if ($OneDriveTypepath) {
                    $ring = (Get-ItemProperty -Path $path -ErrorAction SilentlyContinue).GPOSetUpdateRing
                }

                # Note: Kept $OneDriveTypepath check optional, so it still catches OneDrive even if no GPO policy exists yet
                if ($OneDriveTP) {
                    $FileVersion = (Get-Item $OneDriveEXE).VersionInfo.ProductVersion
                    $status.IsInstalled      = $true
                    $status.IsNotInstalled   = $false
                    $status.CurrentVersion   = $FileVersion
                    $status.InstalledDetails = "Microsoft OneDrive Cloud Backup is Installed at $OneDrivePATH (Version: $FileVersion)"
                    $status.GPOSetting       = if ($ring) { $ring } else { "No GPO Ring Configured" }
                } else {
                    $status.IsInstalled      = $false
                    $status.IsNotInstalled   = $true
                    $status.InstalledDetails = "Microsoft OneDrive Cloud Backup is NOT installed"
                }
            }
        "Google Drive" {
                $GoogleDrivePATH = "C:\Program Files\Google\Drive File Stream\130.0.2.0"
                $GoogleDriveEXE  = "C:\Program Files\Google\Drive File Stream\130.0.2.0\GoogleDriveFS.exe"
                
                $GoogleDriveTP   = Test-Path -Path $GoogleDriveEXE

                if ($GoogleDriveTP) {
                    $FileVersion = (Get-Item $GoogleDriveEXE).VersionInfo.ProductVersion
                    $status.IsInstalled      = $true
                    $status.IsNotInstalled   = $false
                    $status.CurrentVersion   = $FileVersion
                    $status.InstalledDetails = "Google Drive Cloud Backup is Installed at $GoogleDrivePATH (Version: $FileVersion)"
                } else {
                    $status.IsInstalled      = $false
                    $status.IsNotInstalled   = $true
                    $status.InstalledDetails = "Google Drive Cloud Backup is NOT installed"
                }
            }
        "Next Cloud" {
                $NextCloudPATH = "C:\Program Files\Nextcloud"
                $NextCloudEXE  = "C:\Program Files\Nextcloud\nextcloud.exe"
                
                $NextCloudTP   = Test-Path -Path $NextCloudEXE

                if ($NextCloudTP) {
                    $FileVersion = (Get-Item $NextCloudEXE).VersionInfo.ProductVersion
                    $status.IsInstalled      = $true
                    $status.IsNotInstalled   = $false
                    $status.CurrentVersion   = $FileVersion
                    $status.InstalledDetails = "NextCloud Client Cloud Backup is Installed at $NextCloudPATH (Version: $FileVersion)"
                } else {
                    $status.IsInstalled      = $false
                    $status.IsNotInstalled   = $true
                    $status.InstalledDetails = "NextCloud Client Cloud Backup is NOT installed"
                }
            }
        "Apple iCloud" {
                $iCloudPATH = "C:\Program Files (x86)\Common Files\Apple\Internet Services"
                $iCloudEXE  = "C:\Program Files (x86)\Common Files\Apple\Internet Services\iCloud.exe"
                
                $iCloudTP   = Test-Path -Path $iCloudEXE

                if ($NextCloudTP) {
                    $FileVersion = (Get-Item $iCloudEXE).VersionInfo.ProductVersion
                    $status.IsInstalled      = $true
                    $status.IsNotInstalled   = $false
                    $status.CurrentVersion   = $FileVersion
                    $status.InstalledDetails = "Apple iCloud Cloud Backup is Installed at $iCloudPATH (Version: $FileVersion)"
                } else {
                    $status.IsInstalled      = $false
                    $status.IsNotInstalled   = $true
                    $status.InstalledDetails = "Apple iCloud Cloud Backup is NOT installed"
                }
            }

        "Carbpnite" {
                $CarbonitePATH = "C:\Program Files (x86)\Carbonite\Carbonite Backup"
                $CarboniteEXE  = "C:\Program Files (x86)\Carbonite\Carbonite Backup\CarboniteUI.exe"
                
                $CarboniteTP   = Test-Path -Path $CarboniteEXE

                if ($CarboniteTP) {
                    $FileVersion = (Get-Item $CarboniteEXE).VersionInfo.ProductVersion
                    $status.IsInstalled      = $true
                    $status.IsNotInstalled   = $false
                    $status.CurrentVersion   = $FileVersion
                    $status.InstalledDetails = "Carbonite Cloud Backup is Installed at $CarbonitePATH (Version: $FileVersion)"
                } else {
                    $status.IsInstalled      = $false
                    $status.IsNotInstalled   = $true
                    $status.InstalledDetails = "Carbonite Cloud Backup is NOT installed"
                }
            }


         # === Dev Tools region ===

         "Docker Desktop" {
                $DockerDesktopPATH = "C:\Program Files\Docker\Docker"
                $DockerDesktopEXE  = "C:\Program Files\Docker\Docker\Docker Desktop.exe"
                
                $DockerDesktopTP   = Test-Path -Path $DockerDesktopEXE

                if ($DockerDesktopTP) {
                    $FileVersion = (Get-Item $DockerDesktopEXE).VersionInfo.ProductVersion
                    $status.IsInstalled      = $true
                    $status.IsNotInstalled   = $false
                    $status.CurrentVersion   = $FileVersion
                    $status.InstalledDetails = "Docker Desktop is Installed at $DockerDesktopPATH (Version: $FileVersion)"
                } else {
                    $status.IsInstalled      = $false
                    $status.IsNotInstalled   = $true
                    $status.InstalledDetails = "Docker Desktop is NOT installed"
                }
            }

        "GitHub Desktop" {
                $GitHUbDesktopPATH = "C:\Users\$env:username\AppData\Local\GitHubDesktop"
                $GitHUbDesktopEXE  = "C:\Users\$env:username\AppData\Local\GitHubDesktop\GitHubDesktop.exe"
                
                $GitHUbDesktopTP   = Test-Path -Path $GitHUbDesktopEXE

                if ($GitHUbDesktopTP) {
                    $FileVersion = (Get-Item $GitHUbDesktopEXE).VersionInfo.ProductVersion
                    $status.IsInstalled      = $true
                    $status.IsNotInstalled   = $false
                    $status.CurrentVersion   = $FileVersion
                    $status.InstalledDetails = "Git Hub Desktop is Installed at $GitHUbDesktopPATH (Version: $FileVersion)"
                } else {
                    $status.IsInstalled      = $false
                    $status.IsNotInstalled   = $true
                    $status.InstalledDetails = "Git Hub Desktop is NOT installed"
                }
            }
            
            # === Default Fallback ===
            Default {
                $status.InstalledDetails = "Software definition not found in script."
            }
        } # <-- Closes the switch statement

        # Convert hash table to an object for clean output and add to array
        $AllSoftware += [PSCustomObject]$status
    } # <-- Closes the foreach loop

    # Output the final results
    return $AllSoftware | Out-GridView -Title "Results of Software scan"
}

# Define the array lists
$BrowserList = "Google Chrome", "Microsoft Edge", "Mozilla Firefox"
$CloudBackupList = "Dropbox", "Microsoft OneDrive", "Google Drive", "Next Cloud", "Apple iCloud", "Carbonite"
$DevToolsList = "Docker Desktop", "GitHub Desktop"

# Run the function combining both lists
Show-ScanSoftware -SoftwareNames ($BrowserList + $CloudBackupList + $DevToolsList)
