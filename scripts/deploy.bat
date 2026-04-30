@echo off

set SCRIPT_DIR=%~dp0
set PROJECT_ROOT=%SCRIPT_DIR%..
set SRC_DIR=%PROJECT_ROOT%src
set DEST_DIR=%USERPROFILE%\.config\wezterm

echo Deploying wezterm config...
echo Source: %SRC_DIR%
echo Destination: %DEST_DIR%

REM Create destination directory if it doesn't exist
if not exist "%DEST_DIR%" mkdir "%DEST_DIR%"

REM Copy config files
copy "%SRC_DIR%\*.lua" "%DEST_DIR%\"

echo Deployment complete!
echo Config files copied to: %DEST_DIR%
pause
