import 'package:flutter/material.dart';

import './drawer.dart';
import './tab_screen_home.dart';
import '../event/NavigationManager.dart';

/// Main page of the application.
///
/// It will list all the available functions of the application, which includes:
/// 1) Your Medicine Reminders, which maps to medication_list.dart;
/// 2) CHAS Clinics near Your, which maps to chas_screen.dart; and
/// 3) Infectious Bulletin, whichmaps to infectious_screen.dart.
///
/// More features can be added in the future through the addition of Padding and InkWell.
/// All the navigation listed above is done through the mainMenuIndex function, which is found in all_index.dart.
///
/// Author: Chew Loh Seng
///
/// Version: 1.0.0
///
/// Since: 10 March 2021

class MainScreenMenu extends StatelessWidget {
  static const routeName = '/main';
  final List<List<Object>> _items = [
    [2, 'Your Medicine Reminders', Colors.yellow],
    [3, 'CHAS Clinics near You', Colors.green],
    [4, 'Infectious Bulletin', Colors.red],
  ];

  List<Widget> _setButtons(BuildContext context) {
    return [
      for (var i in _items) ...[
        InkWell(
          onTap: () {
            NavigationManager.mainMenuIndex(context, i[0]);
          },
          child: Container(
            padding: EdgeInsets.all(25),
            child: Text(
              i[1],
              style: Theme.of(context).textTheme.headline6,
            ),
            decoration: BoxDecoration(
              color: i[2],
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(5.0)),
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        drawer: MainDrawer(),
        bottomNavigationBar: TabScreen(1),
        appBar: AppBar(
          title: Text(
            "Home Page",
            style: TextStyle(
              fontSize: 23,
              fontFamily: 'Raleway',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _setButtons(context),
            ),
          ),
        ),
      ),
    );
  }
}
