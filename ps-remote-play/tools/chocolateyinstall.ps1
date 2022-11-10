$packageName = 'ps-remote-play'
$installerType = 'exe'
$silentArgs = '/S /v/qn'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://remoteplay.dl.playstation.net/remoteplay/module/win/RemotePlayInstaller.exe'
$checksum = 'cc02040b8b5b64adf84bae5642272f683e627b79698de5c06e3b7f3d81dd4470'
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
