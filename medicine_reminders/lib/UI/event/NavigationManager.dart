import 'package:flutter/material.dart';

import '../screens/chas_screen.dart';
import '../screens/infectious_screen.dart';
import '../screens/main_screen.dart';
import '../screens/medication_reminder_screen.dart';
import '../screens/widgets/about_us.dart';
import '../screens/widgets/exit_app.dart';

/// All the functions listed in this page is to do page routing, to the different screens availabe.
///
/// The comments above the actual function shows where the .dart file it originates from
///
/// Author: Chew Loh Seng
///
/// Version: 1.0.0
///
/// Since: 22 March 2021
class NavigationManager {
  /// Originates from drawer.dart
  ///
  /// Argument curPage will dictate the next page the application will display.
  static void drawerPageIndex(BuildContext context, int curPage) {
    if (curPage >= 1 && curPage <= 4) {
      allNavigation(context, curPage);
    } else if (curPage == 5) {
      exitApp(context);
    } else if (curPage == 6) {
      aboutUs(context);
    }
  }

  /// Orignates from main_screen.dart
  ///
  /// Argument curPage will dictate the next page the application will display.
  static void mainMenuIndex(BuildContext context, int curPage) {
    if (curPage >= 1 && curPage <= 4) {
      allNavigation(context, curPage);
    }
  }

  /// Originates from tab_screen_home.dart
  ///
  /// Argument curPage will dictate the next page the application will display.
  static void tabIndex(BuildContext context, int curPage) {
    if (curPage >= 1 && curPage <= 4) {
      allNavigation(context, curPage);
    } else if (curPage == 5) {
      exitApp(context);
    }
  }

  /// Originates from any functions that requires standard page pushing.
  ///
  /// Argument curPage will dictate the next page the application will display.
  /// If the curPage falls outside the 4 pages, the caller function will need to implement separately
  static void allNavigation(BuildContext context, int curPage) {
    if (curPage == 1) {
      Navigator.of(context).pushReplacementNamed(MainScreenMenu.routeName);
    } else if (curPage == 2) {
      Navigator.of(context)
          .pushReplacementNamed(MedicineReminderScreen.routeName);
    } else if (curPage == 3) {
      Navigator.of(context).pushReplacementNamed(ClinicLocatorScreen.routeName);
    } else if (curPage == 4) {
      Navigator.of(context)
          .pushReplacementNamed(InfectiousBulletinScreen.routeName);
    }
  }
}
