$packageName = 'ps-remote-play'
$installerType = 'exe'
$silentArgs = '/S /v/qn'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://remoteplay.dl.playstation.net/remoteplay/module/win/RemotePlayInstaller.exe'
$checksum = '84157138f75922b237d7cfb2af404c465528385ef85b2b6c097c4a22d998e17d'
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
