import './medication_event.dart';
import '../models/medication.dart';

/// SetMedications class is a subclass of MedicationEvent where it adds new medication to the current database
///
/// Author: Chockalingam Kasi
///
/// Version: 1.0.0
///
/// Since: 1 April 2021

class SetMedications extends MedicationEvent {
  List<MedicationReminder> medicationList;

  SetMedications(List<MedicationReminder> medications) {
    medicationList = medications;
  }
}
