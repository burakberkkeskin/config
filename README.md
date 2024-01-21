## Overview

Bash scripts for setting my applications and configurations quickly.

Scripts are compatible with Arch Linux only for now.

MacOS support will come in the feature.

The tools that will be installed can be easily seen from arch-setup.sh

## Usage

### Arch Linux

- Clone the repository

```bash
git clone https://github.com/safderun/dotenv.git && cd dotenv
```

- Run the setup script

```bash
./arch-setup.sh
```

## Repo structure

You add new apps using `installPackageWith*` function inside `installPackage.sh`

## For `kdewallet` details

Check the [KDE Wallet](https://wiki.archlinux.org/title/KDE_Wallet#Configure_PAM) page of the Arch Wiki

## For Vscode to Work with `k5wallet`

- Open vscode.

- Press `ctrl + shift + p`

- Search `>preferences:Configure Runtime Arguments`

- Add -> `"password-store": "kwallet5"`
