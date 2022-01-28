import 'package:flutter/material.dart';

import '../event/NavigationManager.dart';

/// Creates the Hamburger Menu at the top left.
///
/// The side panel menu links to the following:
/// 1) Main Page, which maps to main_screen.dart;
/// 2) Medical Services, which maps to medication_list.dart;
/// 3) CHAS Clinics, which maps to chas_screen.dart;
/// 4) Health Hazards, which maps to infectious_screen.dart;
/// 5) Exit, which maps to exit_app.dart; and
/// 6) About Us, which maps to about_us.dart.
///
/// All the navigation listed above is done through the drawerPageIndex function, which is found in all_index.dart.
///
/// Author: Chew Loh Seng
///
/// Version: 1.0.0
///
/// Since: 19 March 2021

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.all(25),
            alignment: Alignment.centerLeft,
            color: Colors.orange,
            child: Text(
              'Welcome to Health Zone!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
          SizedBox(height: 20),
          ListTile(
              leading: Icon(Icons.home, color: Colors.orange, size: 25),
              title: Text(
                'Home Page',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'RobotoCondensed',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                NavigationManager.drawerPageIndex(context, 1);
              }),
          ListTile(
            leading: Icon(Icons.medical_services, color: Colors.cyan, size: 22),
            title: Text(
              'Medical Services',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              NavigationManager.drawerPageIndex(context, 2);
            },
          ),
          ListTile(
            leading: Icon(Icons.local_hospital, color: Colors.white, size: 22),
            title: Text(
              'CHAS Clinics',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              NavigationManager.drawerPageIndex(context, 3);
            },
          ),
          ListTile(
            leading: Icon(Icons.warning, color: Colors.red, size: 22),
            title: Text(
              'Health Hazards',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              NavigationManager.drawerPageIndex(context, 4);
            },
          ),
          ListTile(
            leading:
                Icon(Icons.exit_to_app, color: Colors.deepPurple, size: 20),
            title: Text(
              'Exit',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'RobotoCondensed',
                fontSize: 16,
              ),
            ),
            onTap: () {
              NavigationManager.drawerPageIndex(context, 5);
            },
          ),
          ListTile(
              leading:
                  Icon(Icons.build_circle, color: Colors.white70, size: 20),
              title: Text(
                'About Us',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'RobotoCondensed',
                    fontSize: 16),
              ),
              onTap: () {
                NavigationManager.drawerPageIndex(context, 6);
              }),
        ],
      ),
    );
  }
}
