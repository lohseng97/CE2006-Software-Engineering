---------------------------------Description of all documents submitted--------------------------------------
1. Readme.txt
   Contains all of the descriptions of all documents submitted and how to run the application.

2. Software Requirements Specifications
   Contains:
   a. Functional and Non-functional Requirements
   b. Use Case Model Diagram
   c. Use Case Descriptions Report
   d. Requirement Analysis – Class Diagrams
   e. Requirement Analysis – Sequence Diagrams
   f. Requirement Analysis – Dialogue Map

3. Software Engineering Report
   Contains:
   a. System Architecture Diagram
   b. Object Design – Class Diagrams
   c. Object Design – Sequence Diagrams
   d. Software Engineering Practices Used

4. Use Case Model Diagram
5. Use Case Descriptions Report

6. Requirement Analysis – Class Diagrams
7. Requirement Analysis – Sequence Diagrams
8. Requirement Analysis – Dialogue Map

9. System Architecture Diagram

10. Object Design – Class Diagrams
11. Object Design – Sequence Diagrams
    The second iteration of the class and sequence diagrams.

---------------------------------Description on how to run the application--------------------------------------

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

Please submit a ticket to Group Leader Darryl Tan (dtan103@e.ntu.edu.sg) or Assistant Group Leader Loh Seng (chew0398@e.ntu.edu.sg) if you need help.