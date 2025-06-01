@echo off
echo Adding assets.js script to all HTML files...

powershell -Command "$files = Get-ChildItem -Path '%~dp0' -Filter '*.html'; foreach ($file in $files) { $content = Get-Content -Path $file.FullName -Raw; if ($content -notmatch 'assets\.js') { $content = $content -replace '</body>', '    <!-- Script for click sound effects and 3D elements -->\n    <script src="assets.js"></script>\n  </body>'; Set-Content -Path $file.FullName -Value $content -NoNewline } }"

echo Done! All HTML files now include the assets.js script.
pause