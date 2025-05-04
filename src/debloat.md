# Debloating

[Original Reddit post](https://www.reddit.com/r/blackberry/comments/1iohop2/blackberry_os_1033_clean_r2_for_all_devices/)

This is one of the most basic this you might want to do with your blackberry 10 device, and an important part which is necessary for more advanced modifications.

Hardware requirements:
* PC
* Target blackberry 10 device;
* Good micro-USB cable which can provide stable connection;

Software requirements:
* Linux or Windows OS on host(Mac not tested, but theoretically should work through translation layers);
* Downloaded Autoloaded for version **HIGHER THAN YOUR DEVICE'S**(you can check it in Settings->About->OS Version). Links can be found in original Reddit post. If Reddit link is dead, check out [Special links](./special_links.md);
* Downloaded DBBT(link can also be found in [Special links](./special_links.md));
* [BlackberrySystemPacker](https://github.com/FerreiraPablo/BlackberrySystemPacker);
* (on Windows) [Installed blackberry drivers.](https://lunarproject.org/archive/BlackBerry%2010/Desktop%20Software/Official%20Desktop%20Software/BlackBerryDesktopSoftware_1.2.0.52_B59.exe)

## 1. Split Autoloader with DBBT
Launch DBBT, select Autoloader and click "Split Autoloader". This will output two files, named "OS*.Signed" and "Radio*.Signed".

> On Linux, can be ran with Wine. If you are not familiar enough with Wine, use it with Bottles.

## 2. Use BlackberrySystemPacker to patch OS and Radio
### 2.1. Create folders beside binary named "output" and "signed".
### 2.2. Create text file "patch.txt" and paste next lines into it
```
removeapp com.twitter com.evernote com.linkedin com.tcs.maps com.rim.bb.app.facebook com.rim.bb.app.retaildemoshim sys.socialconnect.linkedin sys.socialconnect.twitter sys.socialconnect.youtube sys.socialconnect.facebook sys.cfs.box sys.cfs.dropbox sys.uri.youtube sys.weather sys.bbm sys.appworld sys.howto sys.help sys.firstlaunch sys.deviceswitch sys.paymentsystem sys.setupbuffet

replace var/pps/system/navigator/config autorun::1 autorun::0
replace var/pps/system/appconfig/sys.settings false true
```
As you can guess, first line removes unusable apps. Other two shouldn't do much, but they prevent some weird issues.


If you plan to downgrade(delete blocklist) and impersonate other users, download needed `var`(not uploaded online yet, TODO) folder and put it into folder `include`, beside binary, and add next line into "patch.txt":
```
push include/var var
```

### 2.3. Create text file "config.json" and paste next lines into it
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

### 2.4. Run blackberrysystempacker.exe
This will create two files in the output folder, "OS-MOD.Signed" and "Radio-MOD.exe"

> On Linux, as previously, can be ran with Wine (and Bottles). Linux version also exists, but untested.

## 3. Flash patched autoloader
<div class="warning">
WARNING! This will delete all data on the device. So backup needed data somewhere, for example on the SD Card.
</div>
Turn off your blackberry device(by holding power button for long enough). Run "Radio-MOD.exe" and plug cable into the phone. Program on PC will ask password for your phone, enter it.

## 4. That's all.
