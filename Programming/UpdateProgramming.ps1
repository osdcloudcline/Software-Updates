# Programming file paths
      $AICursorEditorEXE = "C:\Users\$env:username\AppData\Local\Programs\cursor\Cursor.exe" 
      $VSCode1EXE = "C:\Program Files\Microsoft VS Code\Code.exe"
      $VSCode2EXE = ""C:\Users\$env:username\AppData\Local\Programs\Microsoft VS Code\Code.exe"
      $VS2026EXE = "C:\Program Files\Microsoft Visual Studio\2026\Enterprise\Common7\IDE\devenv.exe"
      




# Define the programming software in a simple list (Array of Objects)
$Programming = @(
    @{ Name = "AI Cursor Editor"; Path = $AICursorEditorEXE; ID = "Anysphere.Cursor" }
    @{ Name = "Microsoft Visual Studio Code"; Path = $VSCode1EXE; ID = "Microsoft.VisualStudioCode" }
    @{ Name = "Microsoft Visual Studio Code"; Path = $VSCode1EXE; ID = "Microsoft.VisualStudioCode" }
    @{ Name = "Microsoft Visual Studio 2026"; Path = $VS2026EXE; ID = "Microsoft.VisualStudio.Enterprise" }
)

$AnyFound = $false

foreach ($App in $Programming) {
    if (Test-Path -Path $App.Path) {
        $AnyFound = $true
        Write-Host "$($App.Name) is installed on $env:computername at $($App.Path)" -ForegroundColor DarkBlue -BackgroundColor White
        Write-Host "`nProcessing updates for: $($App.Name)" -ForegroundColor Cyan
        
        winget upgrade --id $App.ID
        
        Write-Host "Completed: $($App.Name) update`n" -ForegroundColor Green
    } else {
        Write-Host "$($App.Name) is NOT installed on $env:computername" -ForegroundColor Red -BackgroundColor White
    }
}

if (-not $AnyFound) {
    Write-Warning "No Programming software is installed!"
}
