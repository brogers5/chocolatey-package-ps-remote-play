$packageName = 'ps-remote-play'
$installerType = 'exe'
$silentArgs = '/S /v/qn'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://remoteplay.dl.playstation.net/remoteplay/module/win/RemotePlayInstaller.exe'
$checksum = '7ca976a86c7a2f320a543beb09e73a221ef0c849b8b0de8295e2fb0f63722dcf'
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
