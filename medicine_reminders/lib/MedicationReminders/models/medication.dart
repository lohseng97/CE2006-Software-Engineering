import 'medicationDB.dart';

/// Contains basic information of the medication reminder
///
/// Examples of the information includes name,description, time of consumption and consumption dates
/// It also provides mapping functons to convert the medication reminder details
///
/// Author: Chockalingam Kasi
///
/// Version: 1.0.0
///
/// Since: 26 March 2021

class MedicationReminder {
  int id;
  String name;
  String description;
  String startday;
  String time;
  String endday;

  MedicationReminder(
      {this.id,
      this.name,
      this.description,
      this.startday,
      this.time,
      this.endday});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      MedicationDatabaseInterface.COLUMN_NAME: name,
      MedicationDatabaseInterface.COLUMN_DESCRIPTION: description,
      MedicationDatabaseInterface.COLUMN_STARTDAY: startday,
      MedicationDatabaseInterface.COLUMN_TIME: time,
      MedicationDatabaseInterface.COLUMN_ENDDAY: endday,
    };

    if (id != null) {
      map[MedicationDatabaseInterface.COLUMN_ID] = id;
    }

    return map;
  }

  MedicationReminder.fromMap(Map<String, dynamic> map) {
    id = map[MedicationDatabaseInterface.COLUMN_ID];
    name = map[MedicationDatabaseInterface.COLUMN_NAME];
    description = map[MedicationDatabaseInterface.COLUMN_DESCRIPTION];
    startday = map[MedicationDatabaseInterface.COLUMN_STARTDAY];
    time = map[MedicationDatabaseInterface.COLUMN_TIME];
    endday = map[MedicationDatabaseInterface.COLUMN_ENDDAY];
  }
}
