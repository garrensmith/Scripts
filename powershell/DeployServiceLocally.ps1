ECHO "--------- START INSTALL SERVICE---------"

$services_path = "C:\KeyBlade.Services"

if (!(Test-Path -path $services_path))
{
	mkdir $services_path
}
else
{
	ECHO "Uninstall old services"
	Invoke-Expression "$services_path\KeyBlade.Services.Host.exe service uninstall /instance:KeyBladeSettings"
	Invoke-Expression "$services_path\KeyBlade.Services.Host.exe service uninstall /instance:KeyBladeGeneralServices"
	ECHO "Delete files in folder"
	Remove-Item "$services_path\*" -recurse
 
}

ECHO "Copy new files into services folder"
XCopy *.*  "$services_path" /e /s /y
ECHO "Installing services"

Invoke-Expression "$services_path\KeyBlade.Services.Host.exe service install /instance:KeyBladeSettings"
Invoke-Expression "$services_path\KeyBlade.Services.Host.exe service install /instance:KeyBladeGeneralServices"

Start-Service 'KeyBlade WCF Services$KeyBladeSettings'
Start-Service 'KeyBlade WCF Services$KeyBladeGeneralServices'


ECHO "--------- INSTALL SERVICE FINISHED---------"