import 'package:flutter/material.dart';

import '../event/NavigationManager.dart';

/// Creates a bottom navigation bar.
///
/// This is designed to be the default way of navigating between different menus.
/// It includes the following buttons:
/// 1) Home, which maps to main_screen.dart;
/// 2) Reminders, which maps to medication_list.dart;
/// 3) Clinics, which maps to chas_screen.dart
/// 4) Hazards, which maps to infectious_screen.dart; and
/// 5) Exit, which maps to exit_app.dart.
/// All the navigation listed above is done through the curPage function.
///
/// The curPage function will also pass the corresponding index over to tabIndex function to do the navigation, which is found in all_index.dart.
///
/// The TabScreen also shows the current menu page the user is in.
/// 1) Current menu: The current logo will be black, and with text.
/// 2) Not in current menu: The other logos will be white, and without text.
/// The colour of the navigation bar will change as well, to increase visibility for user convenience.
///
/// Author: Chew Loh Seng
///
/// Version: 1.0.0
///
/// Since: 21 March 2021

class TabScreen extends StatelessWidget {
  TabScreen(int curPage) {
    this.curPage = curPage - 1;
  }

  BuildContext context1;

  int curPage;

  void _curPage(int index) {
    index++;
    NavigationManager.tabIndex(context1, index);
  }

  @override
  Widget build(BuildContext context) {
    context1 = context;

    return BottomNavigationBar(
      onTap: _curPage,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.black,
      selectedFontSize: 15,
      unselectedFontSize: 12,
      currentIndex: curPage,
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
          backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.amber,
          icon: Icon(Icons.medical_services),
          label: 'Reminders',
          //activeIcon: Icon(Icons.sim_card),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.green,
          icon: Icon(Icons.local_hospital),
          label: 'Clinics',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.red,
          icon: Icon(Icons.warning),
          label: 'Hazards',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.red,
          icon: Icon(Icons.exit_to_app_sharp),
          label: 'Exit',
        ),
      ],
    );
  }
}
