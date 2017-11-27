@echo off

:: Date for Windows < 8.1, I think?
:: FOR /F "tokens=1-4 delims=/ " %%a IN ("%date%") DO set d1=%%d-%%b-%%c

:: Format: "B4 yyyy-mm-dd HhMmSs"
FOR /F "tokens=1-3 delims=:." %%a IN ("%time%") DO set timeStr=%%ah%%bm%%cs
set backupDir="B4 %date% %timeStr%"

md %backupDir%
move ss_*.jpg %backupDir%

set imageNum=0
set maxSize=0
set minSize=0
set quality=0.2
set accuracy=5
set delay=180

:loop

java -jar %CD%\screenshot.jar %imageNum% %quality%

set file="ss_%imageNum%.jpg"
FOR /F "usebackq" %%A IN ('%file%') DO set imageSize=%%~zA

if %imageSize% LEQ %maxSize% (
  if %imageSize% GEQ %minSize% (
    del %file%
  )
)

set /a imageNum=%imageNum%+1
set /a maxSize=%imageSize%+%accuracy%
set /a minSize=%imageSize%-%accuracy%

timeout /t %delay% /nobreak

goto loop
