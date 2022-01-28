import 'package:flutter/material.dart';

import './events/address_list_manager.dart';
import 'models/clinicDB.dart';

/// The interface for the clinic locator component of the application.
///
/// This will show the buttons that the user will need to select, either to show
/// all the clinics in Singapore or for particular regions of Singapore.
///
/// Author: Chew Loh Seng
///
/// Version: 1.0.0
///
/// Since: 3 April 2021
class ChasPage extends StatelessWidget {
  final link = ClinicDatabaseInterface.addrDataSingleton.chasWebsiteLink;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                AddressListNavigationMgr.handleURLButtonPress(context, link);
              },
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: const EdgeInsets.all(25),
                child: Text(
                  'View All Clinics at data.gov.sg',
                  style: Theme.of(context).textTheme.headline6,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.limeAccent.withOpacity(0.8),
                      Colors.green,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(12.5)),
            InkWell(
              onTap: () {
                AddressListNavigationMgr.viewAddrList(context, 1);
              },
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: const EdgeInsets.all(25),
                child: Text(
                  'List of Available Clinics - North',
                  style: Theme.of(context).textTheme.headline6,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.tealAccent.withOpacity(0.8),
                      Colors.teal,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            InkWell(
              onTap: () {
                AddressListNavigationMgr.viewAddrList(context, 2);
              },
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: const EdgeInsets.all(25),
                child: Text(
                  'List of Available Clinics - North-East',
                  style: Theme.of(context).textTheme.headline6,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.pinkAccent.withOpacity(0.8),
                      Colors.pink,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            InkWell(
              onTap: () {
                AddressListNavigationMgr.viewAddrList(context, 3);
              },
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: const EdgeInsets.all(25),
                child: Text(
                  'List of Available Clinics - East',
                  style: Theme.of(context).textTheme.headline6,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.orangeAccent.withOpacity(0.8),
                      Colors.deepOrange,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            InkWell(
              onTap: () {
                AddressListNavigationMgr.viewAddrList(context, 4);
              },
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: const EdgeInsets.all(25),
                child: Text(
                  'List of Available Clinics - West',
                  style: Theme.of(context).textTheme.headline6,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.cyanAccent.withOpacity(0.8),
                      Colors.blue,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            InkWell(
              onTap: () {
                AddressListNavigationMgr.viewAddrList(context, 5);
              },
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: const EdgeInsets.all(25),
                child: Text(
                  'List of Available Clinics - Central',
                  style: Theme.of(context).textTheme.headline6,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.yellowAccent.withOpacity(0.8),
                      Colors.yellow.shade800,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
