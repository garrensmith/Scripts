$ServiceLocation = get-wmiobject Win32_process -filter "name = 'KeyBlade.Services.WindowsService.exe'" | select path
$path = $ServiceLocation.Path -replace  "KeyBlade.Services.WindowsService.exe",""
stop-service "KeyBlade Services"
Copy-Item .\*.* $path -force
Start-Service "KeyBlade Services"