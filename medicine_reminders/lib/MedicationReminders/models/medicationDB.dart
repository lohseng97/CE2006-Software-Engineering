import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'medication.dart';

/// Helps to control the database operations such as Create, Read, Update, Delete features
///
/// Author: Chockalingam Kasi
///
/// Version: 1.0.0
///
/// Since: 18 March 2021

class MedicationDatabaseInterface {
  static const String TABLE_MEDICATION = "food";
  static const String COLUMN_ID = "id";
  static const String COLUMN_NAME = "name";
  static const String COLUMN_DESCRIPTION = "description";
  static const String COLUMN_STARTDAY = "startday";
  static const String COLUMN_ENDDAY = "endday";
  static const String COLUMN_TIME = "time";

  MedicationDatabaseInterface._();
  static final MedicationDatabaseInterface db = MedicationDatabaseInterface._();

  Database _currDatabase;

  ///Acquires the latest database from the declared path
  ///Creates a new database if there is no database at present location
  Future<Database> get _database async {
    print("database getter called");

    if (_currDatabase != null) {
      return _currDatabase;
    }

    _currDatabase = await _createDatabase();

    return _currDatabase;
  }

  ///Creates a new database with the respective columns
  Future<Database> _createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'foodDB1.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        print("Creating medicine table");

        await database.execute(
          "CREATE TABLE $TABLE_MEDICATION ("
          "$COLUMN_ID INTEGER PRIMARY KEY,"
          "$COLUMN_NAME TEXT,"
          "$COLUMN_DESCRIPTION TEXT,"
          "$COLUMN_STARTDAY TEXT,"
          "$COLUMN_TIME TEXT,"
          "$COLUMN_ENDDAY TEXT"
          ")",
        );
      },
    );
  }

  ///Gets the database information
  Future<List<MedicationReminder>> getMedications() async {
    final db = await _database;

    var medications = await db.query(TABLE_MEDICATION, columns: [
      COLUMN_ID,
      COLUMN_NAME,
      COLUMN_DESCRIPTION,
      COLUMN_STARTDAY,
      COLUMN_TIME,
      COLUMN_ENDDAY
    ]);

    List<MedicationReminder> medicationList = List<MedicationReminder>();

    medications.forEach((currentMedication) {
      MedicationReminder medication =
          MedicationReminder.fromMap(currentMedication);

      medicationList.add(medication);
    });

    return medicationList;
  }

  ///Insert new reminder details into the database table
  Future<MedicationReminder> insert(MedicationReminder medication) async {
    final db = await _database;
    medication.id = await db.insert(TABLE_MEDICATION, medication.toMap());

    return medication;
  }

  ///Deletes the row from the database Id according to the respective ID
  Future<int> delete(int id) async {
    final db = await _database;

    return await db.delete(
      TABLE_MEDICATION,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  ///Updates the specific row in the database with the latest values
  Future<int> update(MedicationReminder medication) async {
    final db = await _database;

    return await db.update(
      TABLE_MEDICATION,
      medication.toMap(),
      where: "id = ?",
      whereArgs: [medication.id],
    );
  }
}
