Import-Module au

function global:au_BeforeUpdate ($Package) {
    $Latest.ChecksumType64 = 'sha256'
    $Latest.Checksum64 = Get-RemoteChecksum -Url $Latest.Url64 -Algorithm SHA256

    Set-DescriptionFromReadme -Package $Package -ReadmePath '.\DESCRIPTION.md'
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1'   = @{
            "(^[$]?\s*url64bit\s*=\s*)('.*')"       = "`$1'$($Latest.Url64)'"
            "(^[$]?\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(^[$]?\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }
        "$($Latest.PackageName).nuspec" = @{
            '(<packageSourceUrl>)[^<]*(</packageSourceUrl>)' = "`$1https://github.com/brogers5/chocolatey-package-$($Latest.PackageName)/tree/v$($Latest.Version)`$2"
            '(<copyright>)[^<]*(</copyright>)'               = "`$1© $($(Get-Date -Format yyyy)) Sony Interactive Entertainment Inc. All Rights Reserved.`$2"
        }
    }
}

function global:au_GetLatest {
    $latestInfoUri = 'https://remoteplay.dl.playstation.net/remoteplay/module/win/rp-version-win.json'
    $userAgent = 'Update checker of Chocolatey Community Package ''ps-remote-play'''

    $jsonResponse = Invoke-RestMethod -Uri $latestInfoUri -Method Get -UserAgent $userAgent -UseBasicParsing
    $softwareVersion = $jsonResponse.version
    $semVerVersion = [version] $softwareVersion

    return @{
        Url64   = "https://remoteplay.dl.playstation.net/remoteplay/module/win/RemotePlayInstaller_$($softwareVersion)_Win32.msi"
        Version = $semVerVersion    #This may change if building a package fix version
    }
}

Update-Package -ChecksumFor None -NoReadme