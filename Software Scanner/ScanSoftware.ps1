<#
.SYNOPSIS
    Professional PowerShell script to scan installed software on a Windows machine.
.DESCRIPTION
    Queries 64-bit and 32-bit registry hives as well as the CIM/WMI database
    to assemble a de-duplicated, clean inventory of installed applications.
#>

[CmdletBinding()]
param(
    [Parameter()]
    [string]$OutputPath
)

process {
    $InstalledApps = [System.Collections.Generic.List[PSCustomObject]]::new()

    # Define Registry Paths for Installed Software
    $RegPaths = @(
        "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*",
        "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*",
        "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*"
    )

    # Gather Registry Entries
    foreach ($Path in $RegPaths) {
        if (Test-Path (Split-Path $Path)) {
            $Apps = Get-ItemProperty -Path $Path -ErrorAction SilentlyContinue |
                Where-Object { $_.DisplayName -and $_.SystemComponent -ne 1 -and $_.ParentKeyName -eq $null }

            foreach ($App in $Apps) {
                $InstalledApps.Add([PSCustomObject]@{
                    DisplayName    = $App.DisplayName
                    DisplayVersion = $App.DisplayVersion
                    Publisher      = $App.Publisher
                    InstallDate    = $App.InstallDate
                    UninstallString= $App.UninstallString
                    InstallSource  = "Registry"
                })
            }
        }
    }

    # Add CIM / Win32_Product alternative or supplement if required
    # (Note: Win32_Product is slow/heavy, but CIM Win32_Product can be queried safely via package provider)
    $CimApps = Get-CimInstance -ClassName Win32_Product -ErrorAction SilentlyContinue
    foreach ($CimApp in $CimApps) {
        if ($CimApp.Name) {
            $InstalledApps.Add([PSCustomObject]@{
                DisplayName    = $CimApp.Name
                DisplayVersion = $CimApp.Version
                Publisher      = $CimApp.Vendor
                InstallDate    = $CimApp.InstallDate
                UninstallString= $null
                InstallSource  = "CIM"
            })
        }
    }

    # De-duplicate results by Name and Version
    $FinalInventory = $InstalledApps | Sort-Object DisplayName, DisplayVersion -Unique

    # Output or Export
    if ($OutputPath) {
        $FinalInventory | Export-Csv -Path $OutputPath -NoTypeInformation
        Write-Host "Inventory successfully saved to $OutputPath" -ForegroundColor Green
    } else {
        $FinalInventory | Out-GridView -Title "Installed Software Inventory"
    }
}
