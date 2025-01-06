@ECHO off
::==============================================================================
TITLE GetQt5Sdk

ECHO;
ECHO Running "GetQt5Sdk.bat"...

::==============================================================================
:: Check if admin

net session 1>NUL 2>NUL

IF NOT %ERRORLEVEL% == 0 (
	echo "[ERROR] | Must run this as administrator."
	exit
) 

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

SET QT_DOMAIN=https://download.qt.io/official_releases/online_installers
SET QT_URL=%QT_DOMAIN%/qt-unified-windows-%ARCH%-online.exe 
	:: https://download.qt.io/official_releases/online_installers/qt-unified-windows-x64-online.exe

SET QT_TMP=%TMP%\GetQtSdk
SET QT_INSTALLER=qt-online-installer-windows-%ARCH%-VERSION.exe

SET QT_DIR=%ProgramData%\Qt

::==============================================================================
:: Make %QT_TMP%\

IF NOT EXIST %QT_TMP%  (
  mkdir %QT_TMP%
) 

::==============================================================================
:: Check if Qt Installer is present

where /r %QT_TMP% *.exe 1>NUL 2>NUL

::=================================
:: Download Qt Installer 

IF NOT %ERRORLEVEL% == 0 (
	curl -fLs -o %QT_TMP%\%QT_INSTALLER% %QT_URL%
) 
::=================================

::==============================================================================
:: Run Installer
%QT_TMP%\%QT_INSTALLER% -t %QT_DIR% --accept-licenses --accept-obligations --auto-answer "telemetry-question=No,AssociateCommonFiletypes=Yes" --confirm-command "install" "qt5-sdk"
 
::==============================================================================
:: Keep tty alive

ECHO;
PAUSE