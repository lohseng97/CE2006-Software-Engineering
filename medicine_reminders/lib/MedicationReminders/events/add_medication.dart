import './medication_event.dart';
import '../models/medication.dart';

/// Addmediction class is a subclass of MedicationEvent where it adds new medication to the current database
///
/// Author: Chockalingam Kasi
///
/// Version: 1.0.0
///
/// Since: 1 April 2021

class AddMedication extends MedicationEvent {
  MedicationReminder newMedication;

  AddMedication(MedicationReminder medication) {
    newMedication = medication;
  }
}
