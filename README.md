# a simple PS <-> KW calculator

# flutter
* get flutter SDK
* set flutter SDK to environment variable PATH: <...>\flutter\bin
* set android SDK / toolchain to environment variable PATH: <...>\android\sdk\platform-tools
* visual studio code with flutter extension
    - create hello world flutter with CTRL + SHIFT + P > flutter
* flutter commands
    - flutter doctor    // will find flutter, android toolchain if set properly and android devices
    - flutter devices   // will list devices
    - flutter run   // run app :)
* screenshot with adb
```
adb shell screencap -p /sdcard/screen.png
adb pull /sdcard/screen.png .
```

![flutter app power[ps/kw]](screen0.png)