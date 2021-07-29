start C:\Users\user\Next.bat
:loop
timeout /t 7200 /nobreak
taskkill /f /im Rotor3.exe
Goto :loop