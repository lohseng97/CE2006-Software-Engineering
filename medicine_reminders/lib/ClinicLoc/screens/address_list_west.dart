import 'package:flutter/material.dart';

import './buttonCHAS.dart';
import '../models/clinicDB.dart';
import '../events/address_list_manager.dart';
import '../../UI/screens/drawer.dart';
import '../../UI/screens/tab_screen_home.dart';

/// The AddressListWest class shows the available CHAS Clinics in the Western Region of Singapore.
///
/// Reference to the different regions of the country is stated in chas_screen_revamp.dart.
/// Users can choose specific places in the region, and the associated GitHub Render will be passed into handleURLButtonPress function in all_index.dart.
///
/// All the geojson files are available at www.github.com/lohseng97/CE2006/tree/maps.
/// Do note that Censorship of GitHub exists and therefore connection might not always be available outside of Singapore.
///
/// Author: Chew Loh Seng, Royce Tan Chun Wei
///
/// Version: 1.0.0
///
/// Since: 2 April 2021

class AddressListWest extends StatelessWidget {
  //static const String routeName = '/list-address-west';
  final Color colorSel = Colors.cyan;
  final List<List<Object>> items =
      ClinicDatabaseInterface.addrDataSingleton.getWestData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Address List - West')),
      drawer: MainDrawer(),
      bottomNavigationBar: TabScreen(3),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i in items) ...[
                ClinicButton(
                  colorSel: colorSel,
                  textSel: i[0],
                  action: () {
                    AddressListNavigationMgr.handleURLButtonPress(
                        context, i[1]);
                  },
                ),
                Padding(padding: EdgeInsets.all(10.0)),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
