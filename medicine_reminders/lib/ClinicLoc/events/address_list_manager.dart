import 'package:flutter/material.dart';

import '../screens/webview.dart';
import '../screens/address_list_central.dart';
import '../screens/address_list_east.dart';
import '../screens/address_list_north.dart';
import '../screens/address_list_northeast.dart';
import '../screens/address_list_west.dart';

/// Contains all the functions need to navigate between the AddressList classes
/// and a way to display a website to the user.
///
/// Author: Chew Loh Seng
///
/// Version: 1.0.0
///
/// Since: 3 April 2021

class AddressListNavigationMgr {
  /// Originates from any .dart files that requires internet access and web browser access.
  ///
  /// Argument url will be pushed to the WebViewContainer to let users see the linked website.
  static void handleURLButtonPress(BuildContext context, String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(url)));
  }

  /// Function used to navigate between all the AddressList classes.
  static void viewAddrList(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddressListNorth()));
    } else if (index == 1) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AddressListNorthEast()));
    } else if (index == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddressListEast()));
    } else if (index == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddressListWest()));
    } else if (index == 4) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AddressListCentral()));
    }
  }
}
