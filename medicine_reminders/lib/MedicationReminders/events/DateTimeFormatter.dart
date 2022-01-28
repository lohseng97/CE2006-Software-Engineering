import 'package:intl/intl.dart';

/// Conatins the functions need to format a particular string of DateTime
/// to the required format.
///
/// Author: Chockalingam Kasi
///
/// Version: 1.0.0
///
/// Since: 1 April 2021
class DateTimeFormatter {
  /// Parses the String date by removing the hours,minutes and seconds.
  /// Keeps only the day, month and year information
  static String convertdate(String date) {
    DateTime tempDate = new DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
    String parseddate = DateFormat("dd-MM-yyyy").format(tempDate);
    return parseddate;
  }

  /// Parses the String date by removing the day,month,year
  /// Keeps the hour and minute information
  static String converttime(String date) {
    DateTime tempDate = new DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
    String parseddate;
    parseddate = DateFormat("hh:mm a").format(tempDate);
    return parseddate;
  }
}
