# GetQtSdk

## Installation
- The files inside of ```./src/``` will help install the Qt SDK by targeting a specfic install directory.
  - These must be ran as an administrator. 
    - ```./src/GetQtSdk.bat``` will install the latest version of the SDK.
    - ```./src/GetQt5Sdk.bat``` will install version 5 of the SDK.
    - ```./src/GetQtSdk.tmp.bat``` is a work-in-progress variation on this installation method.
  - Multiple versions of Qt can exist concurrently.
## PATH  
-  All QT files will be installed to ```%ProgramData%\Qt\```
    - ```%ProgramData%\Qt\Tools\QtCreator\bin\qtcreator.exe```
      -  This will launch the "Qt Creator" IDE.
    - ```%ProgramData%\Qt\<VERSION_NUM>\```
      - Qt will install all related version files to a directory named with the version number.
        - Example: ```%ProgramData%\Qt\5.15.2\```
-  Adding Executables to %PATH%
    - Run ```sysdm.cpl```
    - Navigate to the "Advanced" tab
    - Press the "Environment Variables..."   

## TODO
- Automate Adding Symlinks to Executables to %PATH%
- Notate that Qt by default will try to install to: ```C:\Qt\```
