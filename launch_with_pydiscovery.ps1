Push-Location
$picosdkpath = (Get-ItemProperty "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*Raspberry Pi Pico SDK*" | Select-Object -ExpandProperty InstallPath)
Set-Location $picosdkpath
& '.\pico-env.ps1'
$pythonpath = py.exe -c "import os, sys; print(os.path.dirname(sys.executable))"
Pop-Location
$startCommand = $pythonpath + "\python.exe" 
Start-Process -FilePath $startCommand -ArgumentList "pico_project.py --gui"