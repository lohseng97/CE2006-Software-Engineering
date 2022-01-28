/// Medication Event is an abstract class where variables can be inherited.
///
/// It is mainly used by MedicationBloc to control the List of Medication Reminders as a state.
/// This is manly an interface so that the events that changes the state and thus, the list can be
/// realised from this interface.
///
/// Some features can be added to this abstract class in the future.
///
/// Author: Chockalingam Kasi
///
/// Version: 1.0.0
///
/// Since: 1 April 2021

abstract class MedicationEvent {}
