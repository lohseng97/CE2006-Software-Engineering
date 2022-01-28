import 'package:flutter/material.dart';

import './drawer.dart';
import './tab_screen_home.dart';
import '../../InfectiousBulletin/infectiousPage.dart';

/// Infectious Bulletin page of the application.
///
/// It will call the InfectiousPage class, which will display the graphs of the top 3 infections in Singapore over the past 4 weeks.
///
/// Author: Chew Loh Seng
///
/// Version: 1.0.0
///
/// Since: 8 April 2021

class InfectiousBulletinScreen extends StatelessWidget {
  static const routeName = '/infected-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Infectious Bulletin",
          style: TextStyle(
            fontSize: 23,
            fontFamily: 'Raleway',
          ),
        ),
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: TabScreen(4),
      body: InfectiousPage(),
    );
  }
}
