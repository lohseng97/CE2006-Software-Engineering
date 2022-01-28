import './medication_event.dart';
import '../models/medication.dart';

/// UpdateMedication class is a subclass of MedicationEvent where it updates information of the medication reminder from the database
///
/// Author: Chockalingam Kasi
///
/// Version: 1.0.0
///
/// Since: 28 March 2021

class UpdateMedication extends MedicationEvent {
  MedicationReminder newMedication;
  int medicationIndex;

  UpdateMedication(int index, MedicationReminder medication) {
    newMedication = medication;
    medicationIndex = index;
  }
}
