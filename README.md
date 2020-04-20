
# flutter: linux
* get SDK: `git clone https://github.com/flutter/flutter.git flutter`
* add flutter binary to path
* run `flutter` will download dart SDK: `flutter/bin/cache/dart-sdk/`
* run `flutter doctor` and follow the instructions (install android studio, android sdk, ...)
    * hint for android studio desktop entry: `configure > create desktop entry`
    * if you want to use android studio for flutter developer then install plugin: flutter and dart
    * also add android sdk to path: `android/sdk/platform-tools`
* run `flutter devices` to list your device
* run app with `flutter run` - ensure device or emulator is running.

__android emulator__
* check if acceleration is on:
```
$ kvm-ok
INFO: /dev/kvm exists
KVM acceleration can be used
```
* list / run emulators
```
flutter emulators
flutter emulators --launch Pixel_2_API_29
```

__troubleshooting__
* i had the curious case that my device was list with `adb devices` also with `flutter devices` but not in android studio. Issue was solved when i set env variable `ANDROID_HOME=.../android/sdk`

__visual studio code__
* visual studio code with flutter extension: create hello world flutter with: `CTRL + SHIFT + P > flutter`

__links__
* https://flutter.dev/docs/get-started/install/linux
* https://developer.android.com/studio/run/emulator-acceleration?utm_source=android-studio#vm-linux

__screenshot with adb__
```
adb shell screencap -p /sdcard/screen.png
adb pull /sdcard/screen.png .
```

# flutter: windows
* get flutter SDK
* set flutter SDK to environment variable PATH: <...>\flutter\bin
* set android SDK / toolchain to environment variable PATH: <...>\android\sdk\platform-tools
