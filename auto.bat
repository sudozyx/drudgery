@ECHO ON
cd bot
start eve.py

set hour=%time:~0,2%
set min=%time:~3,2%

set /a a=7

set /a b=%a%+6
set /a c=%b%+6
set /a d=%c%+6

set /a l=3

if %d% geq 24 (
    set /a "d=%d%-24"
) else ( 
    goto ok22
) 
:ok22
if %l% geq %d% (
    set /a q=%d%+24-%l%
) else ( 
    set /a p=%d%-%l%
) 
:ok222
schtasks /delete /tn s1 /f
schtasks /delete /tn s2 /f
schtasks /delete /tn s3 /f
schtasks /delete /tn s4 /f  
schtasks /create /sc DAILY /tn s1 /tr "G:\My Drive\#Absolute pvt ltd\EVE\auto.bat" /st %a%:00:00 /f
schtasks /create /sc DAILY /tn s1 /tr "G:\My Drive\#Absolute pvt ltd\EVE\auto.bat" /st 0%a%:00:00 /f
schtasks /create /sc DAILY /tn s2 /tr "G:\My Drive\#Absolute pvt ltd\EVE\auto.bat" /st %b%:00:00 /f
schtasks /create /sc DAILY /tn s2 /tr "G:\My Drive\#Absolute pvt ltd\EVE\auto.bat" /st 0%b%:00:00 /f
schtasks /create /sc DAILY /tn s3 /tr "G:\My Drive\#Absolute pvt ltd\EVE\auto.bat" /st %c%:00:00 /f
schtasks /create /sc DAILY /tn s2 /tr "G:\My Drive\#Absolute pvt ltd\EVE\auto.bat" /st 0%c%:00:00 /f

netsh wlan show networks
netsh wlan connect Starlink

del C:\Users\pc14\AppData\Local\Temp /f /q
rmdir C:\Users\pc14\AppData\Local\Temp /s /q 
cd %cd%\eve\walls

goto ok
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "BO darbi" /min "%~f0" %* && exit
:ok

if %hour% equ %d% (
    if %min% equ 00 (

        timeout /t 3
        taskkill /f /fi "STATUS eq running"       
        cd ..
        push 
    ) else (
        goto END1
    )
) else (
    goto END1
)
:END1
if %hour% equ %u% (
    if %min% equ 00 (

        timeout /t 3
        taskkill /f /fi "STATUS eq running" 
        cd ..
        push  
    ) else (
        goto END2   
    )
) else (
    goto END2
)
:END2
if %d% geq 24 (
    schtasks /create /sc DAILY /tn s4 /tr "G:\My Drive\#Absolute pvt ltd\EVE\auto.bat" /st 0%p%:00:00 /f
    schtasks /create /sc DAILY /tn s4 /tr "G:\My Drive\#Absolute pvt ltd\EVE\auto.bat" /st %p%:00:00 /f
    goto alt2
) else (
    schtasks /create /sc DAILY /tn s4 /tr "G:\My Drive\#Absolute pvt ltd\EVE\auto.bat" /st 0%q%:00:00 /f 
    schtasks /create /sc DAILY /tn s4 /tr "G:\My Drive\#Absolute pvt ltd\EVE\auto.bat" /st %q%:00:00 /f
    goto alt1
)

:alt1
if %hour% GEQ %q% (
    if %hour% LSS %d% ( 

        start firefox https://www.blogger.com/blog/posts/273122595862652461
        schtasks /create /sc DAILY /tn s4 /tr "G:\My Drive\#Absolute pvt ltd\EVE\auto.bat" /st 0%d%:00:00 /f 
        schtasks /create /sc DAILY /tn s4 /tr "G:\My Drive\#Absolute pvt ltd\EVE\auto.bat" /st %d%:00:00 /f                              
    ) ELSE (
        goto b
    )
) ELSE (
    goto b
)

:alt2
if %hour% GEQ %p% (
    if %hour% LSS %u% (

        start firefox https://www.blogger.com/blog/posts/273122595862652461
        schtasks /create /sc DAILY /tn s4 /tr "G:\My Drive\#Absolute pvt ltd\EVE\auto.bat" /st 0%u%:00:00 /f 
        schtasks /create /sc DAILY /tn s4 /tr "G:\My Drive\#Absolute pvt ltd\EVE\auto.bat" /st %u%:00:00 /f                                   
    ) ELSE (
        goto b
    )
) ELSE (
    goto b
)

:b
if %hour% GEQ %c% (
    if %hour% LSS %d% (

        push
        exit
    ) ELSE (
        goto c
    )
) ELSE (
    goto c
)

:c
if %hour% GEQ %b% (
    if %hour% LSS %c% (

        push
        exit
    ) ELSE (
        goto o
    )
) ELSE (
    goto o
)

:o
if %hour% GEQ %a% (
    if %hour% LSS %b% ( 

        push
        exit
    ) ELSE (
        goto f
    )
) ELSE ( 
    push.bat
    goto f
)
:f
exit
