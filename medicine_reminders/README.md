# HealthZone Android Application

HealthZone let users do the following:
- Set custom Medicine Reminders, with scheduled notifications
- Find nearest General Practitioner (GP) Clinics, participating under CHAS program
- See Singapore's Top 3 Infections.

## Installation instructions
Steps to run the application:
1) Unzip the ZIP with folder name: "medicine_reminders"
2) Open Visual Studio Code (VS Code)
3) Open the project folder
4) You might have to install Flutter and Dart in VS Code, as well as set up Android Studio.
Details on setting up Android Studio: https://flutter.dev/docs/get-started/install
Details on installing Flutter and Dart in VS Code: https://flutter.dev/docs/development/tools/vs-code
4) Inside terminal, type in "flutter clean". This is to make sure dependencies are not based on the developer's PC.
5) After cleanup, open Android Phone Emulator (in Android Studio) or plug in Android phone in USB debugging mode.
Details of how to set up Android Phone Emulator in Android Studio: https://developer.android.com/studio/run/emulator
Details of how to set up USB debugging mode: https://developer.android.com/studio/debug/dev-options
6) Inside terminal, type in "flutter pub get". This is to get all the external packages set up in your system in VS Code.
7) Inside terminal, type in "flutter run". This is to set up the file structures based on your system in VS Code.
8) After building, you might need to run the application if it is not done automatically.
Type in F5 (debugging mode) or Ctrl+F5 (Run without debugging) to install the apk into the Android emulator or phone.


In case the flutter build fails, these steps might need to be done:
1) Unzip the ZIP with folder name: "medicine_reminders".
2) Open Visual Studio Code (VS Code).
3) You might have to install Flutter and Dart in VS Code, as well as set up Android Studio.
Details on setting up Android Studio: https://flutter.dev/docs/get-started/install
Details on installing Flutter and Dart in VS Code: https://flutter.dev/docs/development/tools/vs-code
4) Create new project under the package name "medicine_reminders"
5) Copy and replace the following files from the downloaded (and upzipped) "medicine_reminders" to the newly created "medicine_reminders":
- All folder and files in the lib folder
- All folder and files in the assets folder
- "pubspec.yaml" file in the root folder
- All folder and files in "android/app/src" folder
6) Open Android Phone Emulator (in Android Studio) or plug in Android phone in USB debugging mode.
Details of how to set up Android Phone Emulator in Android Studio: https://developer.android.com/studio/run/emulator
Details of how to set up USB debugging mode: https://developer.android.com/studio/debug/dev-options
7) Inside terminal, type in "flutter pub get". This is to get all the external packages set up in your system in VS Code.
8) Inside terminal, type in "flutter run". This is to set up the file structures based on your system in VS Code.
9) After building, you might need to run the application if it is not done automatically.
Type in F5 (debugging mode) or Ctrl+F5 (Run without debugging) to install the apk into the Android emulator or phone.
