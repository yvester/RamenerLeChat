@echo off
echo Set the registry key for ramenerlechat!
echo %ProgramFiles(x86)%
Reg add HKEY_CLASSES_ROOT\7-Zip.zip\shell\RamenerLeChat\command /t REG_SZ /d "\"%ProgramFiles(x86)%\ramenerlechat\source\Process.bat\" ""%%1\" /f
Reg add HKEY_CLASSES_ROOT\7-Zip.zip\shell\RamenerLeChatBW513\command /t REG_SZ /d "\"%ProgramFiles(x86)%\ramenerlechat\source\ProcessBW513.bat\" ""%%1\" /f
REM pause
