$packageName = 'ps-remote-play'
$installerType = 'exe'
$silentArgs = '/S /v/qn'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://remoteplay.dl.playstation.net/remoteplay/module/win/RemotePlayInstaller.exe'
$checksum = '9189BBFC8AC173BDD5FE39AD723CA206A8DD788CBCB166F9AE2887A51E7C30EA'
$checksumType = 'sha256'
$validExitCodes = @(0)
 
Install-ChocolateyPackage -PackageName "$packageName" `
                          -FileType "$installerType" `
                          -SilentArgs "$silentArgs" `
                          -Url "$url" `
                          -ValidExitCodes $validExitCodes `
                          -Checksum "$checksum" `
                          -ChecksumType "$checksumType"
