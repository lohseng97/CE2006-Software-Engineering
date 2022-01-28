import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './UI/screens/LockScreen.dart';
import './UI/screens/chas_screen.dart';
import './UI/screens/infectious_screen.dart';
import './UI/screens/medication_reminder_screen.dart';
import './UI/screens/main_screen.dart';

import './MedicationReminders/events/medication_bloc.dart';

/// Contains the void main() function, which is the entry point when the application is opened.
///
/// When initialising, the third party widgets are required to be initialised as well, to make sure app reliability.
/// Therefore, the main function will start running MyApp class.
/// The MyApp class will create the system theme for the application, and sets up all the routes required for the other screens.
/// It will enter the LockScreen class (initialRoute: '/root'), at LockScreen.dart, after initialisation is complete.
///
/// Author: Chew Loh Seng
///
/// Version: 1.0.0
///
/// Since: 10 March 2021

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MedicationBloc>(
      create: (context) => MedicationBloc(),
      child: MaterialApp(
        title: 'Health Zone',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.amber,
          canvasColor: Colors.black,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(10, 21, 21, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(10, 21, 21, 1),
                ),
                headline6: TextStyle(
                  fontSize: 21,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
        ),
        initialRoute: '/root',
        routes: {
          MainScreenMenu.routeName: (context) => MainScreenMenu(),
          LockScreen.routeName: (context) => LockScreen(),
          MedicineReminderScreen.routeName: (context) =>
              MedicineReminderScreen(),
          ClinicLocatorScreen.routeName: (context) => ClinicLocatorScreen(),
          InfectiousBulletinScreen.routeName: (context) =>
              InfectiousBulletinScreen(),
        },
      ),
    );
  }
}
