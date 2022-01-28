//import 'package:flutter/material.dart';

///Specifies number of Case(s) of an infectious disease
///for a particular epidemiological week
///
/// dateval: (DateTime) End Date of Epidemiological Week
///
/// caseval: (int) Number of disease cases for the Week specified
///
/// Author: Lim Jun Wei
///
/// Version: 1.0.0
///
/// Since: 3 April 2021
class Case {
  DateTime dateval;
  int caseval;

  Case(this.dateval, this.caseval);
}
