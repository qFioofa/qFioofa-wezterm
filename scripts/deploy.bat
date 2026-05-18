@echo off
set SCRIPT_DIR=%~dp0
set SRC_DIR=%SCRIPT_DIR%..\src
set DEST_DIR=%USERPROFILE%\.config\wezterm

echo Deploying wezterm config...
echo Source: %SRC_DIR%
echo Destination: %DEST_DIR%

REM Create destination directory if it doesn't exist
if not exist "%DEST_DIR%" mkdir "%DEST_DIR%"

REM Use xcopy to copy recursively, overwrite without prompting, and copy hidden files
xcopy "%SRC_DIR%\*" "%DEST_DIR%\" /E /I /Y /H /Q

echo.
echo Deployment complete!
echo Config files copied to: %DEST_DIR%
