@echo off
@setlocal enableextensions
@cd /d "%~dp0"
Powershell.exe Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
rem Powershell.exe choco install pandoc --force --force-dependencies
rem Powershell.exe choco install rsvg-convert --force --force-dependencies
rem Powershell.exe choco install python --force --force-dependencies
rem Powershell.exe choco install miktex --force --force-dependencies
Powershell.exe Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
Powershell.exe Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Powershell.exe scoop install curl
Powershell.exe scoop update curl
Powershell.exe scoop install marp
Powershell.exe scoop update marp
for %%# in (*.md) do set "file_name=%%~nx#"
echo file found %file_name%
Powershell.exe marp %file_name% --pdf -o %file_name%_slide.pdf --allow-local-files
Powershell.exe marp %file_name% -o %file_name%_slide.html --allow-local-files
Powershell.exe marp %file_name% --pptx -o %file_name%_slide.pptx --allow-local-files
rem Powershell.exe pandoc %file_name% --pdf-engine=xelatex -V colorlinks -V urlcolor=NavyBlue -V toccolor=Red --toc -N -o %file_name%_doc.pdf
pause