<!--markdownlint-disable-next-line MD033 MD045 -->
# <img src="https://cdn.jsdelivr.net/gh/brogers5/chocolatey-package-ps-remote-play@11f5a086de23a08ffa153e7efb8528445fca28c4/ps-remote-play.png" width="48" height="48"/> Chocolatey Package: [PS Remote Play](https://community.chocolatey.org/packages/ps-remote-play)

[![Latest package version shield](https://img.shields.io/chocolatey/v/ps-remote-play.svg)](https://community.chocolatey.org/packages/ps-remote-play)
[![Total package download count shield](https://img.shields.io/chocolatey/dt/ps-remote-play.svg)](https://community.chocolatey.org/packages/ps-remote-play)

## Install

[Install Chocolatey](https://chocolatey.org/install), and run the following command to install the latest approved stable version from the Chocolatey Community Repository:

```shell
choco install ps-remote-play --source="'https://community.chocolatey.org/api/v2'"
```

Alternatively, the packages as published on the Chocolatey Community Repository (starting with v7.5.0.8061) will also be mirrored on this repository's [Releases page](https://github.com/brogers5/chocolatey-package-ps-remote-play/releases). The `nupkg` can be installed from the current directory (with dependencies sourced from the Community Repository) as follows:

```shell
choco install ps-remote-play --source="'.;https://community.chocolatey.org/api/v2/'"
```

## Build

[Install Chocolatey](https://chocolatey.org/install), clone this repository, and run the following command in the cloned repository:

```shell
choco pack
```

A successful build will create `ps-remote-play.w.x.y.z.nupkg`, where `w.x.y.z` should be the Nuspec's normalized `version` value at build time.

>[!Note]
>Chocolatey package builds are non-deterministic. Consequently, an independently built package's checksum will not match that of the officially published package.

## Update

This package should be automatically updated by the [Chocolatey Automatic Package Updater Module](https://github.com/majkinetor/au). If it is outdated by more than a few days, please [open an issue](https://github.com/brogers5/chocolatey-package-ps-remote-play/issues).

AU expects the parent directory that contains this repository to share a name with the Nuspec (`ps-remote-play`). Your local repository should therefore be cloned accordingly:

```shell
git clone git@github.com:brogers5/chocolatey-package-ps-remote-play.git ps-remote-play
```

Alternatively, a junction point can be created that points to the local repository (preferably within a repository adopting the [AU packages template](https://github.com/majkinetor/au-packages-template)):

```shell
mklink /J ps-remote-play ..\chocolatey-package-ps-remote-play
```

Once created, simply run `update.ps1` from within the created directory/junction point. Assuming all goes well, all relevant files should change to reflect the latest version available. This will also build a new package version using the modified files.

Before submitting a pull request, please [test the package](https://docs.chocolatey.org/en-us/community-repository/moderation/package-verifier#steps-for-each-package) using the latest [Chocolatey Testing Environment](https://github.com/chocolatey-community/chocolatey-test-environment) first.
