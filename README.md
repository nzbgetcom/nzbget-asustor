# NZBGet package for ASUSTOR NAS

This package during install downloads latest stable version of NZBGet. Then it can be updated via NZBGet automatic update.

## Installation

1. Download latest release apk file.
2. On ASUSTOR NAS open `App Central` -> `Management` -> `Manual install` -> `Browse` -> Select downloaded apk -> `Upload`
3. On the next window press `Next`, then set checkbox "I understand the risks associated with installing unverified Apps" and press `Install`

## Configuration

NZBGet WebUI is available from <NAS_IP_OR_HOSTNAME>:6789

Default username/password is:
```
Username: nzbget
Password: tegbzn6789
```

Default shared folder for NZBGet is `Download` (it will be created during install if not exist).

Path for NZBGet files is `Download\NZBGet`.

## Extensions

You can put custom extensions in `ScriptDir` directory.

Default `ScriptDir`: `Download\NZBGet\scripts`.

To support python3 extensions, need to install `Python 3` package from `App Central`, no additional configuration is required.

## Switching from [NZBGet](https://www.asustor.com/app_central/app_detail?id=85&type=) package by `Clinton.Hall`

1. Backup configuration file (`Settings` -> `SYSTEM` -> `Backup`)
2. Save additionally `Setting` -> `PATHS` -> `MainDir`
3. Remove `nzbget` package
4. Install `nzbgetcom` package
5. Login to WebUI with Username: nzbget / Password: tegbzn6789.
6. Restore configuration (`Settings` -> `SYSTEM` -> `Restore` -> Select conf saved in p.1 -> *Important* Select all sections except `PATHS` and `UNPACK` -> Restore -> Save all changes)
7. At this point WebUI auth is changed to old `nzbget` package (Username: nzbget Password: admin)
8. Go to `Settings` -> `PATHS` -> set `MainDir` to value saved in p.2. Save all changes.
9. Reinstall installed extensions if needed (via ExtensionManage or manually).

## Building package

### Prerequisites

Linux host with `Python 3` and `fakeroot` installed. On Debian/Ubuntu prerequisites can be installed via `sudo apt install python3 fakeroot`

### Build package

From the cloned repository run: `./build.sh`. Package (*.apk) will be in the `./build/` directory.
