import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/add_medication.dart';
import '../events/update_medication.dart';
import '../events/medication_bloc.dart';
import '../events/NotificationSystemManager.dart';
import '../models/medication.dart';
import '../models/medicationDB.dart';

/// Displays the form to provide interface for the user to key in information on the medical reminders
///
/// Author: Chockalingam Kasi
///
/// Version: 1.0.0
///
/// Since: 29 March 2021

class MedicationForm extends StatefulWidget {
  final MedicationReminder medication;
  final int medicationIndex;

  MedicationForm({this.medication, this.medicationIndex});

  @override
  State<StatefulWidget> createState() {
    return _MedicationFormState();
  }
}

class _MedicationFormState extends State<MedicationForm> {
  NotificationSystemManager notificationSystem;
  String _name;
  String _description;
  int _id = (DateTime.now().millisecondsSinceEpoch % 10000000000) ~/ 1000;

  DateTime selectedDate = DateTime.now();
  DateTime selectedendDate = DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TimeOfDay _watchtime = TimeOfDay.now();
  String _startday = DateTime.now().toString();
  String _endday = DateTime.now().toString();
  String _time = DateTime.now().toString();
  int flag = 0;
  @override
  void initState() {
    super.initState();
    if (widget.medication != null) {
      _name = widget.medication.name;
      _description = widget.medication.description;
      _startday = widget.medication.startday;
      _time = widget.medication.time;
      _endday = widget.medication.endday;
      _id = widget.medication.id;
      selectedDate = DateTime.parse(widget.medication.startday);
      selectedendDate = DateTime.parse(widget.medication.endday);
      _watchtime = TimeOfDay.fromDateTime(selectedDate);
    }
    notificationSystem = NotificationSystemManager.initializePlugin();
  }

  ///Function to select the time for setting reminder
  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _watchtime,
    );
    if (newTime != null) {
      setState(() {
        _watchtime = newTime;
        _time = DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day, _watchtime.hour, _watchtime.minute)
            .toString();
        _startday = new DateTime(
                DateTime.parse(_startday).year,
                DateTime.parse(_startday).month,
                DateTime.parse(_startday).day,
                _watchtime.hour,
                _watchtime.minute,
                00)
            .toString();
        _endday = new DateTime(
                DateTime.parse(_endday).year,
                DateTime.parse(_endday).month,
                DateTime.parse(_endday).day,
                _watchtime.hour,
                _watchtime.minute,
                00)
            .toString();
      });
    }
  }

  ///Function to select the start date for reminders
  _selectstartDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _startday = selectedDate.toString();
        if (selectedDate.millisecondsSinceEpoch >
            selectedendDate.millisecondsSinceEpoch) {
          selectedendDate = picked;
          _endday = selectedendDate.toString();
        }
      });
  }

  ///Function to select the end date for reminders
  _selectendDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedendDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (selectedDate.millisecondsSinceEpoch > picked.millisecondsSinceEpoch) {
      print("End Date cannot be before start date");
      flag = 1;
    }
    if (picked != null && picked != selectedendDate)
      setState(() {
        if (flag == 0) {
          selectedendDate = picked;
          _endday = selectedendDate.toString();
        } else {
          picked = selectedDate;
          selectedendDate = selectedDate;
          _endday = selectedendDate.toString();
          flag = 0;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Medicine Details")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(
                  labelText: 'Medicine Name',
                  labelStyle: TextStyle(color: Colors.deepOrangeAccent),
                  hintText: 'Enter name',
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.orange,
                  hoverColor: Colors.orange,
                  focusColor: Colors.orange,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.white60)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.orange)),
                ),
                style: TextStyle(color: Colors.white, fontSize: 20),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Medicine Name required';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _name = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                initialValue: _description,
                decoration: InputDecoration(
                  labelText: 'Medicine Description',
                  labelStyle: TextStyle(color: Colors.deepOrangeAccent),
                  hintText: 'Enter description',
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.orange,
                  focusColor: Colors.orange,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.deepOrange)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.white60)),
                ),
                style: TextStyle(color: Colors.white, fontSize: 20),
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Medicine Description required';
                  }
                  return null;
                },
                onSaved: (String value) {
                  _description = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () => _selectstartDate(context), // Refer step 3
                child: Text(
                  'START DATE:    ' +
                      "${selectedDate.day}" +
                      "-" +
                      "${selectedDate.month}" +
                      "-" +
                      "${selectedDate.year}",
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  textStyle: TextStyle(fontSize: 23),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () => _selectendDate(context), // Refer step 3
                child: Text(
                  'END DATE:    ' +
                      "${selectedendDate.day}" +
                      "-" +
                      "${selectedendDate.month}" +
                      "-" +
                      "${selectedendDate.year}",
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  textStyle: TextStyle(fontSize: 23),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: _selectTime,
                child:
                    Text('REMINDER TIME: ' + '${_watchtime.format(context)}'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 25),
                  textStyle: TextStyle(fontSize: 23),
                  primary: Colors.deepOrange,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 20),
              widget.medication == null
                  ? ElevatedButton(
                      child: Text(
                        'Submit',
                      ),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 24),
                        primary: Colors.lightGreen,
                        onPrimary: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 25),
                      ),
                      onPressed: () async {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _startday = new DateTime(
                                DateTime.parse(_startday).year,
                                DateTime.parse(_startday).month,
                                DateTime.parse(_startday).day,
                                _watchtime.hour,
                                _watchtime.minute,
                                00)
                            .toString();
                        _endday = new DateTime(
                                DateTime.parse(_endday).year,
                                DateTime.parse(_endday).month,
                                DateTime.parse(_endday).day,
                                _watchtime.hour,
                                _watchtime.minute,
                                00)
                            .toString();
                        _formKey.currentState.save();

                        MedicationReminder medication = MedicationReminder(
                          id: _id,
                          name: _name,
                          description: _description,
                          startday: _startday,
                          time: _time,
                          endday: _endday,
                        );

                        MedicationDatabaseInterface.db.insert(medication).then(
                              (storedFood) =>
                                  BlocProvider.of<MedicationBloc>(context).add(
                                AddMedication(storedFood),
                              ),
                            );
                        print(_id);

                        notificationSystem.scheduleNotification(
                            _id,
                            DateTime.parse(_startday),
                            DateTime.parse(_endday),
                            _name,
                            _description);
                        _id++;
                        Navigator.pop(context);
                      },
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          child: Text(
                            "Update",
                          ),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 24),
                            primary: Colors.lightGreen,
                            onPrimary: Colors.black87,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 25),
                          ),
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              print("form");
                              return;
                            }

                            _startday = new DateTime(
                                    DateTime.parse(_startday).year,
                                    DateTime.parse(_startday).month,
                                    DateTime.parse(_startday).day,
                                    _watchtime.hour,
                                    _watchtime.minute,
                                    00)
                                .toString();
                            _endday = new DateTime(
                                    DateTime.parse(_endday).year,
                                    DateTime.parse(_endday).month,
                                    DateTime.parse(_endday).day,
                                    _watchtime.hour,
                                    _watchtime.minute,
                                    00)
                                .toString();

                            _formKey.currentState.save();

                            MedicationReminder medication = MedicationReminder(
                              name: _name,
                              id: _id,
                              description: _description,
                              startday: _startday,
                              time: _time,
                              endday: _endday,
                            );
                            MedicationDatabaseInterface.db
                                .update(medication)
                                .then(
                                  (storedFood) =>
                                      BlocProvider.of<MedicationBloc>(context)
                                          .add(
                                    UpdateMedication(
                                        widget.medicationIndex, medication),
                                  ),
                                );
                            notificationSystem.cancelNotification(
                                _id,
                                DateTime.parse(_startday),
                                DateTime.parse(_endday));
                            notificationSystem.scheduleNotification(
                                _id,
                                DateTime.parse(_startday),
                                DateTime.parse(_endday),
                                _name,
                                _description);
                            print(_id);
                            Navigator.pop(context);
                          },
                        ),
                        ElevatedButton(
                          child: Text(
                            "Cancel",
                          ),
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 18),
                            primary: Colors.red,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
