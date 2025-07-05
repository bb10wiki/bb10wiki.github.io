# A couple of words about BlackberryOS10...

This page aims to describe how BlackberryOS10 works, what are the current limitations for using it as daily driver and what are proposed solutions.

## About BlackberryOS10 itself.

### It is a QNX-based OS...
In the nutshell - QNX is UNIX-like operating system, so you can expect a lot of stuff from Linux and BSD systems work and usual. You can compile a lot of Linux using cross-compiler(or even compiling on the device itself, what BerryMuch is doing) and they would work most of the time.

BlackberryOS10 is based off of QNX 6.5.0.

Still, it uses a lot of proprietary technologies and utilities: no systemd(or any regular daemon manager).

### Signing Apps
As you already guessed, BBOS10 is more similar to iOS than Android, in the sense that BBOS10 was designed to run only signed apps(which is not the case for Android). RIM did a lot of work to assure that unsigned apps wouldn't be able to run.

## Running unsigned apps

### Android runtime
Probably your first gut-reaction to try and use BBOS10 as daily driver would be to take advantage of built-in Android runtime. Sadly, there are a lot of problems with this solution:
- Performance. Even one of the latest BBOS10 devices, the Q20(Classic), heats up a lot from using basic apps(for example Telegram X or available Firefox browser). And even with this hit, most of the time framerate of apps is ~15FPS and battery drain is huge. Even worse - apps crash a lot.
- You are limited to Android 4.3. Self explanatory, this is a very, very old version of Android, and finding new apps is practically impossible.
- You cannot use some native APIs of BBOS10 from Android runtime.

### Hosting web services
Second gut-reaction would be to create and host web services or proxies for needed services. This is not a bad idea, and some servers can be ran from BBOS10 itself.

#### Hosting on web
The problem with solution is that you'd need a server, obviously, which is not free.

Examples include: instant messaging web app from FerreiraPablo - a web matrix client.

#### Hosting locally on BBOS10
The problem with this solution is necessity to start server every device reboot and necessity of deep understanding how to design such servers.
