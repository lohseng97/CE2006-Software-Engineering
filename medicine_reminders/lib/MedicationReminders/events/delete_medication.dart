import './medication_event.dart';

/// DeleteMedication class is a subclass of MedicationEvent where it deletes a medication reminder stored in the database
///
/// Author: Chockalingam Kasi
///
/// Version: 1.0.0
///
/// Since: 29 March 2021

class DeleteMedication extends MedicationEvent {
  int medicationIndex;

  DeleteMedication(int index) {
    medicationIndex = index;
  }
}
