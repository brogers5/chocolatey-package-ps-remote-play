$ErrorActionPreference = 'Stop'

Confirm-Win10 -ReqBuild 14393

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'MSI'
    url            = 'https://remoteplay.dl.playstation.net/remoteplay/module/win/RemotePlayInstaller_8.0.0.14120_Win32.msi'
    softwareName   = 'PS Remote Play'
    checksum       = '1ddba7e05856b20c60dae35fb4ef41b05d733863cea959901e21b7b46dff33e5'
    checksumType   = 'sha256'
    validExitCodes = @(0, 3010, 1641)
    silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
