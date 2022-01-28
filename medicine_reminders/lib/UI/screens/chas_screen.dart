import 'package:flutter/material.dart';

import './drawer.dart';
import './tab_screen_home.dart';
import '../../ClinicLoc/chas_page.dart';

/// The ChasScreen class let users do the following:
/// 1) view the most up-to-date list of Chas Clinics posted in data.gov.sg, OR
/// 2) let users choose their preferred locations based on different zones.
/// Zones in #2 are defined by https://www.iproperty.com.sg/news/know-which-district-you-are-in-based-on-postal-code/
/// viewJsonList function is responsible for navigating user's choice in #2 to the respective pages.

/// Author: Chew Loh Seng
/// Version: 1.0.0
/// Since: 27 March 2021

class ClinicLocatorScreen extends StatelessWidget {
  static const String routeName = '/clinic-screen';

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Chas Clinic Finder',
            style: TextStyle(
              fontSize: 23,
              fontFamily: 'Raleway',
            ),
          ),
        ),
        drawer: MainDrawer(),
        bottomNavigationBar: TabScreen(3),
        resizeToAvoidBottomInset: false,
        body: ChasPage(),
      ),
    );
  }
}
