# Downgrade

Downgrade procedure is possible due to discoveries done by Oleksandr, and post about which you can find [here](https://bb10.root.sx).

To do downgrade, you would need to firstly do steps, detailed in [Debloating guide](./debloat.md). After you're done, you can return here.

Additional needed software:
* Term49 [.bar file](https://github.com/BerryFarm/Term49/releases/download/0.4.1.7/Term49.bar);
* [AppManager](https://lunarproject.org/archive/BlackBerry%2010/Desktop%20Software/App%20Manager/)(not the only way).


## 1. Install Term49 on the device
### 1.0. Make sure your computer and blackberry device connected to the same network
### 1.1. Turn on Developer mode on blackberry device
Go to Settings->Security and Privacy->Developer Mode->Turn On.
### 1.2. Get IP address of blackberry device
Go to Settings->About->(Change category to Network) and under subsection "Wi-Fi", "IPv4" you will find address. Note it.
### 1.3. Open AppManager and enter noted IP address into it
Proceed with installation of Term49.

## 2. Download get_root.zip
### 2.1. Open your browser and go to the `https://bb10.root.sx/mod_nvram.zip`
### 2.2. Download provided file to the Downloads folder(default destination)

## 3. Delete Blacklist
### 3.3. Open Term49 app on your blackberry device.
### 3.4. Run provided commands in the terminal:
```
cd /accounts/1000/shared/downloads
unzip mod_nvram.zip
cd Device-Release
/q/g_nto
./mod_nvram -d
```
If the output is:
```
Delete OS BLOCK done 0
Delete secure OS BLOCK done 0
Delete RADIO BLOCK done 0
Delete secure RADIO BLOCK done 0
```
you did everything correct and blocklist is deleted.

## 4. Now you can proceed with using any autoloader(for correct device) for your device.
