# app-count

Simple bash script to count Android apps from different install sources. Compatible with Termux and ADB.

## Requirements

Android phone connected to Linux PC via ADB (via cable or wirelessly) or Android phone with Termux installed

## Usage

```bash
wget https://raw.githubusercontent.com/bartekl1/app-count/refs/heads/main/app-count.sh
chmod +x app-count.sh
./app-count.sh
```

## Example output

```text
User apps:
com.android.vending: 60
com.looker.droidify: 20
dev.imranr.obtainium.fdroid: 5
com.google.android.packageinstaller: 4
null: 1
Total: 90

System apps:
null: 300
com.android.vending: 20
Total: 320
```
