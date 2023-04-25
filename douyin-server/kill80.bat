@echo off
setlocal enabledelayedexpansion
for /f "delims=  tokens=1" %%i in ('netstat -aon ^| findstr "8080"') do (
set a=%%i
goto js
)
:js
taskkill /f /pid "!a:~71,5!"
pause>nul