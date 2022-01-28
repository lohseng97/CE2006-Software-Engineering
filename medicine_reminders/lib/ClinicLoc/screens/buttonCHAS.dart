import 'package:flutter/material.dart';

/// Button used for the clinic locator component of the application.
///
/// Author: Chew Loh Seng
///
/// Version: 1.0.0
///
/// Since: 2 April 2021

class ClinicButton extends StatelessWidget {
  final Function action;
  final Color colorSel;
  final String textSel;

  ClinicButton({this.action, this.colorSel, this.textSel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(25),
        child: Text(
          textSel,
          style: Theme.of(context).textTheme.headline6,
        ),
        color: colorSel,
      ),
    );
  }
}
