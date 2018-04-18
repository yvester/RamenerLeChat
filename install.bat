@echo off
echo Welcome to RamenerLeChat! Date : %DATE% Time : %TIME% 

chdir %ProgramFiles(x86)%
PAUSE
del /s /q %ProgramFiles(x86)%\ramenerlechat\*
RMDIR /S /Q %ProgramFiles(x86)%\ramenerlechat
mkdir ramenerlechat
PAUSE
mkdir ramenerlechat\source
mkdir ramenerlechat\config
chdir ramenerlechat\source
set NamePath=%~p0
echo namepath %NamePath%
echo programpath  "%ProgramFiles(x86)%\ramenerlechat\source"
xcopy /y C:%NamePath%source\Process.bat "%ProgramFiles(x86)%\ramenerlechat\source"
xcopy /y C:%NamePath%source\ProcessReg.bat "%ProgramFiles(x86)%\ramenerlechat\source"
xcopy /y C:%NamePath%config\Config.bat "%ProgramFiles(x86)%\ramenerlechat\config"
xcopy /y C:%NamePath%source\ProcessBW513.bat "%ProgramFiles(x86)%\ramenerlechat\source"
xcopy /y C:%NamePath%config\ConfigBW513.bat "%ProgramFiles(x86)%\ramenerlechat\config"
PAUSE
REM Execute the registry update
"C:%NamePath%source\ProcessReg.bat"

