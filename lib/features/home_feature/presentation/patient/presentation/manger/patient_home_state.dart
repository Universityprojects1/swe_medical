part of 'patient_home_cubit.dart';

@immutable
sealed class PatientHomeState {}

final class PatientHomeInitial extends PatientHomeState {}
final class AddAppointmentLoadingState extends PatientHomeState {}
final class AddAppointmentErrorState extends PatientHomeState {
  final String message;

  AddAppointmentErrorState(this.message);
}
final class AddAppointmentSuccessState extends PatientHomeState {}
