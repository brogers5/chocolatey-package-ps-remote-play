$packageName = 'ps-remote-play'
$installerType = 'MSI'
$silentArgs = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://remoteplay.dl.playstation.net/remoteplay/module/win/RemotePlayInstaller_6.5.0.08180_Win32.msi'
$checksum = '9c36c405931dd465ce91bc5ccc2a16942500d16ffc3f262082b80dc0130eb62e'
$checksumType = 'sha256'
$validExitCodes = @(0)

Confirm-Win10 14393
 
Install-ChocolateyPackage -PackageName "$packageName" `
                          -FileType "$installerType" `
                          -SilentArgs "$silentArgs" `
                          -Url "$url" `
                          -ValidExitCodes $validExitCodes `
                          -Checksum "$checksum" `
                          -ChecksumType "$checksumType"
