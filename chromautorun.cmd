@echo off
set /P url=Enter FRAMR url: 


if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" (
goto path1 
) ELSE (
IF EXIST "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" (
goto path2 )
IF EXIST "%LocalAppData%\Google\Chrome\Application\chrome.exe" (
goto path3 )
ECHO Chrome not found
exit /b
)

:path1
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "%ProgramFiles%\Google\Chrome\Application\chrome.exe --app=\"%url%\" --start-fullscreen"
exit /b
:path2
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe --app=\"%url%\" --start-fullscreen"
exit /b
:path3
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "%LocalAppData%\Google\Chrome\Application\chrome.exe --app=\"%url%\" --start-fullscreen"
exit /b