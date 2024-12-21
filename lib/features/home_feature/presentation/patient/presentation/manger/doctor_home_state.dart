part of 'doctor_home_cubit.dart';

@immutable
sealed class DoctorHomeState {}

final class DoctorHomeInitial extends DoctorHomeState {}
final class GetAllAppointmentLoadingState extends DoctorHomeState {}
final class GetAllAppointmentSuccessState extends DoctorHomeState {
  final List<AppointmentModel> appointments;

  GetAllAppointmentSuccessState(this.appointments);
}
final class GetAllAppointmentErrorState extends DoctorHomeState {
  final String message;

  GetAllAppointmentErrorState(this.message);
}

