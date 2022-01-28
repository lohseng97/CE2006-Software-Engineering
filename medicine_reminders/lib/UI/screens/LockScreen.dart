import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

import './main_screen.dart';

/// Verifies the user during initial opening of the HealthZone application.
///
/// The medical history can be a sensitive topic to users, therefore the authentication is added to increase user privacy.
/// The class uses the standard Biometric/PIN code authentication available in Android/iOS.
/// After verification is completed (or if there is no authentication methods found), it will route to main_screen.dart.
///
/// Author: Chew Loh Seng
///
/// Version: 1.0.0
///
/// Since: 1 April 2021

class LockScreen extends StatelessWidget {
  static const routeName = '/root';
  final LocalAuthentication _localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: GestureDetector(
          onTap: () async {
            try {
              bool checkBio = await _localAuth.canCheckBiometrics;

              if (checkBio) {
                bool authenticated = await _localAuth.authenticate(
                    localizedReason:
                        "Authenticate to see your medical history");
                if (authenticated) {
                  Navigator.pushReplacementNamed(
                      context, MainScreenMenu.routeName);
                }
              }
            } on PlatformException catch (e) {
              if (e.code == auth_error.notAvailable)
                Navigator.pushReplacementNamed(
                    context, MainScreenMenu.routeName);
              else if (e.code == auth_error.passcodeNotSet)
                Navigator.pushReplacementNamed(
                    context, MainScreenMenu.routeName);
              else if (e.code == auth_error.notEnrolled)
                Navigator.pushReplacementNamed(
                    context, MainScreenMenu.routeName);
              else if (e.code == auth_error.lockedOut) {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              }
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "HealthZone App Login\n\n",
                style: TextStyle(
                    color: Colors.orange,
                    fontFamily: 'RobotoCondensed',
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Icon(
                Icons.fingerprint,
                size: 80.0,
                color: Colors.white,
              ),
              Text(
                "Touch to Login",
                //style: Theme.of(context).textTheme.headline6,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'RobotoCondensed',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
        )));
  }
}
