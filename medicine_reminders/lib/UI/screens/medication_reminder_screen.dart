import 'package:flutter/material.dart';

import './drawer.dart';
import './tab_screen_home.dart';
import '../../MedicationReminders/medication_reminder_page.dart';

/// Medicine Reminder page of the application.
///
/// It will call upon MedcineReminderPage() to show the medicine reminders
/// and respective user actions that can be taken.
///
/// Author: Chew Loh Seng
///
/// Version: 1.0.0
///
/// Since: 10 March 2021
class MedicineReminderScreen extends StatelessWidget {
  static const routeName = '/med-menu';
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Medicine Reminder",
            style: TextStyle(
              fontSize: 23,
              fontFamily: 'Raleway',
            ),
          ),
        ),
        drawer: MainDrawer(),
        bottomNavigationBar: TabScreen(2),
        body: MedicineReminderPage(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            MedicineReminderPage.getMedicationForm(context);
          },
        ),
      ),
    );
  }
}
