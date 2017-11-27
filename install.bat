@echo off
echo Welcome to RamenerLeChat! Date : %DATE% Time : %TIME% 
chdir %ProgramFiles(x86)%
del /s /q %ProgramFiles(x86)%\ramenerlechat\*
RMDIR /S /Q %ProgramFiles(x86)%\ramenerlechat
mkdir ramenerlechat
mkdir ramenerlechat\source
mkdir ramenerlechat\config
chdir ramenerlechat\source
set NamePath=%~p0
echo namepath %NamePath%
echo programpath  "%ProgramFiles(x86)%\ramenerlechat\source"
xcopy /y C:%NamePath%source\Process.bat "%ProgramFiles(x86)%\ramenerlechat\source"
xcopy /y C:%NamePath%source\ProcessReg.bat "%ProgramFiles(x86)%\ramenerlechat\source"
xcopy /y C:%NamePath%config\Config.bat "%ProgramFiles(x86)%\ramenerlechat\config"

REM Execute the registry update
"C:%NamePath%source\ProcessReg.bat"

