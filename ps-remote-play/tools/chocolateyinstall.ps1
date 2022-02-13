$packageName = 'ps-remote-play'
$installerType = 'exe'
$silentArgs = '/S /v/qn'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://remoteplay.dl.playstation.net/remoteplay/module/win/RemotePlayInstaller.exe'
$checksum = '8F71ABDA6E2F227CB0EDB79ED4FD5617EC727BE8D81C1A7919241292AC946CF9'
$checksumType = 'sha256'
$validExitCodes = @(0)
 
Install-ChocolateyPackage -PackageName "$packageName" `
                          -FileType "$installerType" `
                          -SilentArgs "$silentArgs" `
                          -Url "$url" `
                          -ValidExitCodes $validExitCodes `
                          -Checksum "$checksum" `
                          -ChecksumType "$checksumType"
