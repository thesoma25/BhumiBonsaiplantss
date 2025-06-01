# PowerShell script to add assets.js script to all HTML files

$htmlFiles = Get-ChildItem -Path "$PSScriptRoot" -Filter "*.html"

foreach ($file in $htmlFiles) {
    Write-Host "Processing $($file.Name)..."
    
    $content = Get-Content -Path $file.FullName -Raw
    
    # Check if the file already has the assets.js script
    if ($content -notmatch 'assets\.js') {
        # Add the script tag before the closing body tag
        $newContent = $content -replace '</body>', '    <!-- Script for click sound effects and 3D elements -->\n    <script src="assets.js"></script>\n  </body>'
        
        # Write the modified content back to the file
        Set-Content -Path $file.FullName -Value $newContent -NoNewline
        
        Write-Host "Added assets.js script to $($file.Name)"
    } else {
        Write-Host "$($file.Name) already has assets.js script"
    }
}

Write-Host "Done! All HTML files now include the assets.js script."