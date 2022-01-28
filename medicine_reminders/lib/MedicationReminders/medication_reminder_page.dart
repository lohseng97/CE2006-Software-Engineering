import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './screens/medication_form.dart';
import './events/delete_medication.dart';
import './events/set_medications.dart';
import './events/medication_bloc.dart';
import './events/DateTimeFormatter.dart';
import './events/NotificationSystemManager.dart';
import './models/medicationDB.dart';
import './models/medication.dart';

/// Interface for the Medicine Reminder component of the application.
///
/// Displays the medication list which is a summary of the medication reminders that have been set by the User
///
/// Author: Chockalingam Kasi
///
/// Version: 1.0.0
///
/// Since: 27 March 2021

class MedicineReminderPage extends StatefulWidget {
  const MedicineReminderPage({Key key}) : super(key: key);

  static void getMedicationForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MedicationForm()),
    );
  }

  @override
  _MedicineReminderPageState createState() => _MedicineReminderPageState();
}

class _MedicineReminderPageState extends State<MedicineReminderPage> {
  NotificationSystemManager notificationSystem;

  @override
  void initState() {
    super.initState();
    MedicationDatabaseInterface.db.getMedications().then(
      (medicationList) {
        BlocProvider.of<MedicationBloc>(context)
            .add(SetMedications(medicationList));
      },
    );
    notificationSystem = NotificationSystemManager();
  }

  ///Shows pop up box containing information on the medication Reminder
  void _showFoodDialog(
      BuildContext context, MedicationReminder medication, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          medication.name.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 34.0,
          ),
        ),
        content: Text(
          "Dosage: ${medication.description}",
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 24.0,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MedicationForm(
                    medication: medication, medicationIndex: index),
              ),
            ),
            child: Text(
              "Update",
              style: TextStyle(
                  color: Colors.teal,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 22.0,
                  fontWeight: FontWeight.normal),
            ),
          ),
          TextButton(
            onPressed: () =>
                MedicationDatabaseInterface.db.delete(medication.id).then((_) {
              BlocProvider.of<MedicationBloc>(context).add(
                DeleteMedication(index),
              );
              print(medication.id);
              notificationSystem.cancelNotification(
                medication.id,
                DateTime.parse(medication.startday),
                DateTime.parse(medication.endday),
              );
              Navigator.pop(context);
            }),
            child: Text(
              "Delete",
              style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 22.0,
                  fontWeight: FontWeight.normal),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 22.0,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //print("Building entire Medicine list scaffold");
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.black,
      child: BlocConsumer<MedicationBloc, List<MedicationReminder>>(
        builder: (context, foodList) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              print("foodList: $foodList");

              MedicationReminder food = foodList[index];
              return Card(
                color: Colors.teal.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text(food.name.toUpperCase(),
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      )),
                  subtitle: Text(
                    ("Dosage           : ${food.description}\n"
                                "Start Date    :\t" +
                            DateTimeFormatter.convertdate(food.startday) +
                            "\nEnd Date        : " +
                            DateTimeFormatter.convertdate(food.endday) +
                            "\nTime                 : " +
                            DateTimeFormatter.converttime(food.time))
                        .toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'RobotoCondensed',
                      color: Colors.black,
                    ),
                  ),
                  onTap: () => _showFoodDialog(context, food, index),
                ),
              );
            },
            itemCount: foodList.length,
          );
        },
        listener: (BuildContext context, foodList) {},
      ),
    );
  }
}
