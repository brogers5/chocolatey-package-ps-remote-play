$packageName = 'novelwriter'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/vkbo/novelWriter/releases/download/v1.1/novelWriter-1.1-minimal-win.zip'
$checksum = 'C5763892D241674605E03F4FA362500398115737F93F4840A4773F326FFE071E'
$checksumType = 'sha256'
 
Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType"
