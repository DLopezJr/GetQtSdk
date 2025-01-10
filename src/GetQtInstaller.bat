@ECHO off
::==============================================================================
TITLE GetQtInstaller

ECHO;
ECHO Running "GetQtInstaller.bat"...

::==============================================================================
:: Set %ARCH% variable

IF "%PROCESSOR_ARCHITECTURE%" == "AMD64" ( 
	set ARCH=x64
) 

IF "%PROCESSOR_ARCHITECTURE%" == "ARM64" ( 
	set ARCH=arm64
) 

IF ["%ARCH%"] EQU [] ( exit ) 
	:: Print better error message

::==============================================================================
:: VARIABLES

SET DOWNLOADS=%USERPROFILE%\Downloads

SET QT_DOMAIN=https://download.qt.io/official_releases/online_installers
SET QT_URL=%QT_DOMAIN%/qt-unified-windows-%ARCH%-online.exe 

SET QT_TMP=%TMP%\GetQtSdk
SET QT_INSTALLER=qt-online-installer.exe

::==============================================================================
:: Check if Qt Installer is present

where /r %DOWNLOADS% %QT_INSTALLER% 1>NUL 2>NUL

::=================================
:: Download Qt Installer 

IF NOT %ERRORLEVEL% == 0 (	
	curl -fL -o %DOWNLOADS%\%QT_INSTALLER% %QT_URL%
) 
::=================================

::==============================================================================
:: Keep tty alive

ECHO;
PAUSE
