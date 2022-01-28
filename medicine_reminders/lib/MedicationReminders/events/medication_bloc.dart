import 'package:flutter_bloc/flutter_bloc.dart';

import './add_medication.dart';
import './delete_medication.dart';
import './medication_event.dart';
import './set_medications.dart';
import './update_medication.dart';
import '../models/medication.dart';

/// The MedicationBloc class controls the list of reminders to be displayed.
///
/// It calls the respective functions when user chooses Add, delete or update the reminders option
///
/// Author: Chockalingam Kasi
///
/// Version: 1.0.0
///
/// Since: 20 March 2021

class MedicationBloc extends Bloc<MedicationEvent, List<MedicationReminder>> {
  @override
  List<MedicationReminder> get initialState => List<MedicationReminder>();

  @override
  Stream<List<MedicationReminder>> mapEventToState(
      MedicationEvent event) async* {
    if (event is SetMedications) {
      yield event.medicationList;
    } else if (event is AddMedication) {
      List<MedicationReminder> newState = List.from(state);
      if (event.newMedication != null) {
        newState.add(event.newMedication);
      }
      yield newState;
    } else if (event is DeleteMedication) {
      List<MedicationReminder> newState = List.from(state);
      newState.removeAt(event.medicationIndex);
      yield newState;
    } else if (event is UpdateMedication) {
      List<MedicationReminder> newState = List.from(state);
      newState[event.medicationIndex] = event.newMedication;
      yield newState;
    }
  }
}
