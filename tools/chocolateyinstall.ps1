$ErrorActionPreference = 'Stop'

Confirm-Win10 -ReqBuild 14393

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'MSI'
    url            = 'https://remoteplay.dl.playstation.net/remoteplay/module/win/RemotePlayInstaller_7.5.0.08061_Win32.msi'
    softwareName   = 'PS Remote Play'
    checksum       = '6147c767e6c894150d08b350cb0c0f7ab4d8fe9ad1750d1f3d99dac387eca89b'
    checksumType   = 'sha256'
    validExitCodes = @(0, 3010, 1641)
    silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
