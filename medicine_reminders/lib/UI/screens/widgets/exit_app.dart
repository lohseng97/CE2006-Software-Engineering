import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// The exitApp function creates a popup to ask if the user wants to exit the application.
///
/// If the user chooses yes, the application will close the active window.
/// The notifications should still come in, unless the device policy force closes the application.
///
/// Author: Chew Loh Seng
///
/// Version: 1.0.0
///
/// Since: 13 March 2021

void exitApp(BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text('Exit App'),
      content: Text('Do you want to exit HealthZone?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop(false);
          },
          child: Text('No'),
        ),
        TextButton(
          onPressed: () {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
          child: Text('Yes'),
        )
      ],
    ),
  );
}
