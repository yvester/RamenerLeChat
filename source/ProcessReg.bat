@echo off
echo Set the registry key for ramenerlechat!
echo %ProgramFiles(x86)%
reg add HKEY_CLASSES_ROOT\7-Zip.zip\shell\RamenerLeChat\command /t REG_SZ /d "%ProgramFiles(x86)%\ramenerlechat\source\Process.bat %%1" /f
reg add HKEY_CLASSES_ROOT\CompressedFolder\shell\RamenerLeChat\command /t REG_SZ /d "%ProgramFiles(x86)%\ramenerlechat\source\Process.bat %%1" /f
REM pause
