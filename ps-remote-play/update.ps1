Import-Module au

function global:au_BeforeUpdate ($Package)  {
    
}

function global:au_AfterUpdate ($Package)  {
    
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')" = "`$1'$($Latest.Url32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $downloadUrl = "https://remoteplay.dl.playstation.net/remoteplay/module/win/RemotePlayInstaller.exe"

    $tempFile = New-TemporaryFile
    Invoke-WebRequest -Uri $downloadUrl -OutFile $tempFile
    $softwareVersion = $tempFile.VersionInfo.ProductVersion
    Remove-Item -Path $tempFile -Force

    return @{ 
        Url32   = "https://remoteplay.dl.playstation.net/remoteplay/module/win/RemotePlayInstaller_$($softwareVersion)_Win32.msi"
        Version = $softwareVersion
    }
}

Update-Package -ChecksumFor 32 -NoReadme