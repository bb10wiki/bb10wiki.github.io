# Downgrade

Downgrade procedure is possible due to discoveries done by Oleksandr, and post about which you can find [here](https://bb10.root.sx).

## Hardware requirements:
* PC
* Target blackberry 10 device;
* Good micro-USB cable which can provide stable connection;

## Software requirements:
* Downloaded Autoloader for version **HIGHER THAN YOUR DEVICE'S**(you can check it in Settings->About->OS Version). Prepatched autoloader by FerreiraPablo can also be used(found on this [Reddit post](https://www.reddit.com/r/blackberry/comments/1iohop2/blackberry_os_1033_clean_r2_for_all_devices/) or in [Special lnks](./special_links.md));
* Downloaded DBBT(link can also be found in [Special links](./special_links.md));
* [BlackberrySystemPacker](https://github.com/FerreiraPablo/BlackberrySystemPacker);
* (on Windows) [Installed blackberry drivers.](https://lunarproject.org/archive/BlackBerry%2010/Desktop%20Software/Official%20Desktop%20Software/BlackBerryDesktopSoftware_1.2.0.52_B59.exe)
* Term49 [.bar file](https://github.com/BerryFarm/Term49/releases/download/0.4.1.7/Term49.bar);
* [AppManager](https://lunarproject.org/archive/BlackBerry%2010/Desktop%20Software/App%20Manager/)(not the only way).

### 1. Split Autoloader with DBBT
Launch DBBT, select Autoloader and click "Split Autoloader". This will output two files, named "OS*.Signed" and "Radio*.Signed".

> On Linux, can be ran with Wine. If you are not familiar enough with Wine, use it with Bottles.

###  2. Use BlackberrySystemPacker to patch OS and Radio
#### 2.1. Create folders beside binary named "output" and "signed".
#### 2.2. Create text file "patch.txt" and paste next lines into it
```
removeapp com.twitter com.evernote com.linkedin com.tcs.maps com.rim.bb.app.facebook com.rim.bb.app.retaildemoshim sys.socialconnect.linkedin sys.socialconnect.twitter sys.socialconnect.youtube sys.socialconnect.facebook sys.cfs.box sys.cfs.dropbox sys.uri.youtube sys.weather sys.bbm sys.appworld sys.howto sys.help sys.firstlaunch sys.deviceswitch sys.paymentsystem sys.setupbuffet

replace var/pps/system/navigator/config autorun::1 autorun::0
replace var/pps/system/appconfig/sys.settings false true

replace var/pps/services/bbads/configuration www.blackberry.com/app_includes/asdk service.waitberry.com
replace var/pps/system/ota/serverurls cs.sl.blackberry.com service.waitberry.com
replace var/pps/system/ota/serverurls cp256.pushapi.na.blackberry.com service.waitberry.com
replace var/pps/system/ota/serverurls cse.dcs.blackberry.com service.waitberry.com
replace var/pps/system/ota/serverurls cse.doc.blackberry.com service.waitberry.com

push include/var var
```
As you can guess, first line removes unusable apps. Second one disables initial setup, that would normally get you stuck waiting for BBID. Next one prevents weird issues. Five next change server url's to which blackberry device tries very hard to connect(you can read a little bit more about it [here](https://sizeof.cat/post/blackberry-battery-problem/)). Last one adds files from include/var to device's var folder, this allows downgrading(deleting blocklist) and impersonating other users. Download needed `var`(not uploaded online yet, TODO) folder and put it into folder `include`, beside binary.

#### 2.3. Create text file "config.json" and paste next lines into it
```json
{
    "procedure": "autopatch",
    "os": "signed/OS.Signed",
    "radio": "signed/Radio.Signed",
    "outputDir": "output",
    "script": "patch.txt",
    "autoloader": true
}
```

#### 2.4. Run blackberrysystempacker.exe
This will create two files in the output folder, "OS-MOD.Signed" and "Radio-MOD.exe"

> On Linux, as previously, can be ran with Wine (and Bottles). Linux version also exists, but untested.

### 3. Flash patched autoloader
<div class="warning">
WARNING! This will delete all data on the device. So backup needed data somewhere, for example on the SD Card.
</div>
Turn off your blackberry device(by holding power button for long enough). Run "Radio-MOD.exe" and plug cable into the phone. Program on PC will ask password for your phone, enter it.

### 4. Install Term49 on the device
#### 4.0. Make sure your computer and blackberry device connected to the same network
#### 4.1. Turn on Developer mode on blackberry device
Go to Settings->Security and Privacy->Developer Mode->Turn On.
#### 4.2. Get IP address of blackberry device
Go to Settings->About->(Change category to Network) and under subsection "Wi-Fi", "IPv4" you will find address. Note it.
#### 4.3. Open AppManager and enter noted IP address into it
Proceed with installation of Term49.

### 5. Download get_root.zip
#### 5.1. Open your browser and go to the `https://bb10.root.sx/mod_nvram.zip`(TODO: Make a backup online)
#### 5.2. Download provided file to the Downloads folder(default destination)

### 6. Delete Blacklist
#### 6.1. Open Term49 app on your blackberry device.
#### 6.2. Run provided commands in the terminal:
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

### 7. Now you can proceed with using any Autoloader(for correct device) for your device.
