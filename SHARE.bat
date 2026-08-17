@echo off
cd /d "%~dp0"
echo Packing Chem Lab HQ for sharing...
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$stage = Join-Path $env:TEMP 'Chem-Lab-HQ-export'; $root = Join-Path $stage 'Chem-Lab-HQ'; Remove-Item $stage -Recurse -Force -ErrorAction SilentlyContinue; New-Item $root -ItemType Directory -Force | Out-Null; Copy-Item 'index.html','app.js','data.js','styles.css','README.txt','Open-Lab.bat','SHARE.bat' $root; Copy-Item 'images' (Join-Path $root 'images') -Recurse; @('Chem Lab HQ — how to open','=========================','','1. Unzip this folder.','2. Open Chem-Lab-HQ.','3. Double-click index.html','   (or double-click Open-Lab.bat on Windows)','','No internet. No install. Chrome or Edge both work.','','If pictures are missing, extract the zip fully first.','Do not open index.html from inside a closed zip window.') | Set-Content (Join-Path $root 'START-HERE.txt') -Encoding UTF8; $zip = Join-Path (Get-Location) 'Chem-Lab-HQ.zip'; $desk = Join-Path ([Environment]::GetFolderPath('Desktop')) 'Chem-Lab-HQ.zip'; Compress-Archive -Path $root -DestinationPath $zip -Force; Copy-Item $zip $desk -Force; Write-Host ''; Write-Host ('Saved: ' + $zip); Write-Host ('Copied to Desktop: ' + $desk)"
echo.
pause
