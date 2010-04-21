ECHO "--------- DEPLOY LATEST SERVICE---------"


ECHO "STOP SERVICE"
sc stop "KeyBlade WCF Services$KeyBladeSettings"
sc stop "KeyBlade WCF Services$KeyBladeGeneralServices"

ECHO "HACK TO WAIT 2s FOR SERVICE TO STOP"
PING 1.1.1.1 -n 1 -w 2000 >NUL
ECHO "Delete files in folder"

ECHO "DELETE OLD FILES"
del /s /q "c:\KeyBlade.Services\*.*"

ECHO "Copy new files into services folder"
XCopy *.*  "c:\KeyBlade.Services" /e /s /y

ECHO "START SERVICES"
sc start "KeyBlade WCF Services$KeyBladeSettings"
sc start "KeyBlade WCF Services$KeyBladeGeneralServices"


ECHO "--------- UPDATE SERVICE FINISHED---------"