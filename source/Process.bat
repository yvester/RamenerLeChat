@echo off

REM Script Ramenerlechat,
REM ***************************************************
REM Zips the project folder 
REM Generates the SHA on the remote machine
REM Transfer the ZIP and SHA files to the local machine 
REM ***************************************************

REM Get the config parameters 
call "%~dp0%..\config\Config.bat"
REM echo ServerName =  %ServerName%
REM echo PathName =  %PathName%
REM echo filename = %~n1

REM Get the name of the folder to zip 
set ProjectName=%~n1
REM echo ProjectName=%ProjectName%
IF "%ProjectName%" == "" GOTO :MISSINGNAME
  
REM Create the bash script to be executed on the remote server 
(
echo cd /home/tibco
echo mkdir -p ./ramenerlechat
echo rm -f ./ramenerlechat/*
echo cd %PathName%
echo sleep 3s
echo if [ ! -d %PathName%%ProjectName% ]; then
echo   echo "Folder %ServerName%%PathName%%ProjectName% does not exist"  ^> %ProjectName%.sha
echo exit
echo fi
echo zip -r /home/tibco/ramenerlechat/%ProjectName%.zip ./%ProjectName% 
echo md5sum /home/tibco/ramenerlechat/%ProjectName%.zip ^> /home/tibco/ramenerlechat/%ProjectName%.sha
echo sleep 5s 
echo fi
) > %TEMP%\remotescript.txt

REM more %TEMP%\remotescript.txt

cd %~dp1
REM echo "DP13 %~dp1

REM execute the bash script on the remote server
REM echo "%ProgramFiles(x86)%"\Putty\putty.exe -ssh -l tibco -m %TEMP%\remotescript.txt %ServerName% 2>/dev/null
"%ProgramFiles(x86)%"\Putty\putty.exe -ssh -l tibco -m %TEMP%\remotescript.txt %ServerName% 

REM Copy the files from remote server to final folder
REM echo "%ProgramFiles(x86)%"\pscp\pscp.exe -scp -unsafe tibco@%ServerName%:/home/tibco/ramenerlechat/* .
"%ProgramFiles(x86)%"\pscp\pscp.exe -scp -unsafe tibco@%ServerName%:/home/tibco/ramenerlechat/* .

REM Cleanup temp files
REM del %TEMP%\remotescript.txt
GOTO :END

:MISSINGNAME
echo Missing Project Name
Msg * "Name of Project is null in the file, Please enter the name of the project " 
pause
GOTO :END

:END
exit /b