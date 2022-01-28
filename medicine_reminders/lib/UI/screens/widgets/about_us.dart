import 'package:flutter/material.dart';

/// The aboutUs function creates a popup to show the About Us section.
///
/// Author: Chew Loh Seng
///
/// Version: 1.0.0
///
/// Since: 3 April 2021

void aboutUs(BuildContext context) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text('About Us'),
      content: Text('Designed by: DucksAreAwesome LLC\nVersion: 0.9.1 beta'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop(false);
          },
          child: Text('OK'),
        )
      ],
    ),
  );
}
