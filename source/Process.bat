REM Script Ramenerlechat,
REM ***************************************************
REM Zips the project folder 
REM Generates the SHA on the remote machine
REM Transfer the ZIP and SHA files to the local machine 
REM ***************************************************

@echo off

REM Get the config parameters 
call "%~dp0%..\config\Config.bat"
echo ServerName =  %ServerName%
echo PathName =  %PathName%

REM Get the name of the folder to zip 
set /p ProjectName=<%~n1.zip
echo ProjectName=%ProjectName%
IF "%ProjectName%" == "" GOTO :MISSINGNAME
  
REM Create the bash script to be executed on the remote server 
(
echo cd /home/tibco
echo mkdir -p ./ramenerlechat
echo rm -f ./ramenerlechat/*
echo cd ./ramenerlechat/
echo if [ ! -d %PathName%%ProjectName% ]; then
echo   echo "Folder %ServerName%%PathName%%ProjectName% does not exist"  ^> %ProjectName%.sha
echo exit
echo fi
echo zip -r %ProjectName%.zip %PathName%%ProjectName%
echo md5sum %ProjectName%.zip ^> %ProjectName%.sha
echo fi 
) > %TEMP%\remotescript.txt

cd %~dp1

REM execute the bash script on the remote server
echo "%ProgramFiles(x86)%"\Putty\putty.exe -ssh -l tibco -m %TEMP%\remotescript.txt %ServerName%
"%ProgramFiles(x86)%"\Putty\putty.exe -ssh -l tibco -m %TEMP%\remotescript.txt %ServerName%

REM Copy the files from remote server to final folder
echo "%ProgramFiles(x86)%"\pscp\pscp.exe -scp -unsafe tibco@%ServerName%:/home/tibco/ramenerlechat/* .
"%ProgramFiles(x86)%"\pscp\pscp.exe -scp -unsafe tibco@%ServerName%:/home/tibco/ramenerlechat/* .

REM Cleanup temp files
del %TEMP%\remotescript.txt
GOTO :END


:MISSINGNAME
echo Missing Project Name
Msg * "Name of Project is null in the file, Please enter the name of the project " 
pause
GOTO :END

:END
exit /b