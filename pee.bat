REM Account Policies

REM PASSWORD POLICY
net accounts /uniquepw:10 /maxpwage:90 /minpwage:30 /minpwlen:14

REM Account Lockout Policies
net accounts /lockoutduration:30 /lockoutthreshold:5 /lockoutwindow:30

REM Local Policies

REM Audit Policy
auditpol /set /category:* /success:enable
auditpol /set /category:* /failure:enable

REM User Rights Assignment


REM Security Options
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v dontdisplaylastusername /t REG_DWORD /d 1 /f
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v dontdisplayusername /t REG_DWORD /d 1 /f
reg ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 1 /f
reg ADD HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v LimitBlankPasswordUse /t REG_DWORD /d 1 /f
reg ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableCAD /t REG_DWORD /d 0 /f
reg ADD HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v restrictanonymoussam /t REG_DWORD /d 1 /f
reg ADD HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v disabledomaincreds /t REG_DWORD /d 1 /f


REM STOP SERVICES
REM IP Helper
sc config "iphlpsvc" start= disabled 
sc Stop "iphlpsvc"

REM SNMP Trap
sc config "SNMPTRAP" start= disabled 
sc Stop "SNMPTRAP"

REM Remote Registry
sc config "RemoteRegistry" start= disabled 
sc Stop "RemoteRegistry"

REM Remote Desktop Services
sc stop TermService
sc config TermService start= disabled

REM World Wide Web Publishing Service
sc config "W3SVC" start= disabled 
sc Stop "W3SVC"

sc config TapiSrv start= disabled
sc stop TlntSvr

REM Microsoft FTP 
sc stop ftpsvc
sc config ftpsvc start= disabled

----------------------------------- CIS

REM Bluetooth Audio Gateway Service
sc stop BTAGService
sc config BTAGService start= disabled

REM Bluetooth Support Service
sc stop bthserv
sc config bthserv start= disabled

REM Computer Browser
sc stop Browser
sc config Browser start= disabled

REM Downloaded Maps Manager
sc stop MapsBroker
sc config MapsBroker start= disabled

REM Geolocation Service
sc stop lfsvc
sc config lfsvc start= disabled

REM IIS Admin Service
sc stop IISADMIN
sc config IISADMIN start= disabled

REM Infared Monitor Service
sc stop irmon
sc config irmon start= disabled

REM Internet Connection Sharing
sc stop SharedAccess
sc config SharedAccess start= disabled

REM Link-Layer Topology Discovery Mapper
sc stop lltdsvc 
sc config lltdsvc start= disabled

REM LxssManager
sc stop LxssManager
sc config lltdsvc start= disabled

REM Microsoft iSCSI Initator Service
sc stop MSiSCSI
sc config MSiCSI start= disabled

REM OpenSSH SSH Server
sc stop sshd 
sc config sshd start= disabled

REM Peer Name Resolution Protocol
sc stop PNRPsvc
sc config PNRPsvc start= disabled

REM Peer Name Networking Grouping
sc stop p2psvc
sc config p2psvc start= disabled

REM Peer Networking Identity Manager
sc stop p2pimsvc
sc config p2pimsvc start= disabled

REM PNRP Machine Name Publication Service
sc stop PNRPAutoReg
sc config p2pimsvc start= disabled

REM Print Spooler
sc stop Spooler
sc config Spooler start= disabled

REM Problem Reports and Solutions Control Panel Support
sc stop wercplsupport
sc config wercplsupport start= disabled

REM Remote Access Auto Connection Manager
sc stop RasAuto
sc config RasAuto start= disabled

REM Remote Desktop Configuration
sc stop SessionEnv
sc config SessionEnv start= disabled

REM Remote Desktop Services userMode Port Redirector
sc stop UmRdpService
sc config UmRdpSerice start= disabled

REM Remote Procedure Call
sc stop config RPC
sc config RPC start= disabled

REM Remote Procedure Call Locator
sc stop config RpcLocator
sc config RpcLocator start= disabled

REM Routing and Remote Access
sc stop RemoteAccess
sc config RemoteAccess start= disabled

REM Server
sc stop LanmanServer
sc config LanmanServer start= disabled

REM Simple TCP/IP Services
sc stop simptcp
sc config simptcp start= disabled

REM SNMP Service
sc stop SNMP
sc config SNMP start= disabled

REM Special Administration Console Helper
sc stop sacsvr
sc config sacsvr start= disabled

REM SSDP Discovery
sc stop SSDPSRV
sc config SSDPSRV start= disabled

REM Service Control Manager for COM and DCOM
sc stop RpcSs
sc config RpcSs start= disabled

REM HomeGroup Provider
sc stop HomeGroupProvider
sc config HomeGroupProvider start= disabled

REM HomeGroup Listener
sc stop HomeGroupListener
sc config HomeGroupListener start= disabled


REM RUN SERVICES
REM Windows Firewall
sc config "MpsSvc" start= auto
sc Start "MpsSvc"

REM Windows Update
sc config "wuauserv" start= auto
sc Start "wuauserv"

REM Windows Defender 
sc config "SecurityHealthService" start= auto
sc Start "SecurityHealthService"

REM Windows Event Log
sc config "EventLog" start= auto
sc Start "EventLog"

REM Windows Defender Antivirus
sc config "WinDefend" start= auto
sc Start "WinDefend"

REM DNS Client
sc config "Dnscache" start= auto
sc Start "Dnscache"


REM FIREFOX
REM Automatic Update
reg ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox\ /v AppAutoUpdate /t REG_DWORD /d 1 /f

REM Always ask to where to save files
reg ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox\ /v PromptForDownloadLocation /t REG_DWORD /d 1 /f

REM Cookie Configuration
reg ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox\SanitizeOnShutdown /v Cache /t REG_DWORD /d 1 /f
reg ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox\SanitizeOnShutdown /v Cookies /t REG_DWORD /d 1 /f
reg ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox\SanitizeOnShutdown /v Downloads /t REG_DWORD /d 1 /f
reg ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox\SanitizeOnShutdown /v FormData /t REG_DWORD /d 1 /f
reg ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox\SanitizeOnShutdown /v History /t REG_DWORD /d 1 /f
reg ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox\SanitizeOnShutdown /v Sessions /t REG_DWORD /d 1 /f
reg ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox\SanitizeOnShutdown /v SiteSettings /t REG_DWORD /d 1 /f
reg ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox\SanitizeOnShutdown /v OfflineApps /t REG_DWORD /d 1 /f
reg ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox\SanitizeOnShutdown /v Locked /t REG_DWORD /d 1 /f

REM Logins and Passwords
reg ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox /v OfferToSaveLogins /t REG_DWORD /d 0 /f

REM Block Pop-Up Windows
reg ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox\PopupBlocking /v Default /t REG_DWORD /d 1 /f
reg ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Mozilla\Firefox\PopupBlocking /v Locked /t REG_DWORD /d 1 /fr
