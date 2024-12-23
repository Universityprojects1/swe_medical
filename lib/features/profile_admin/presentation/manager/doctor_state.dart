part of 'doctor_cubit.dart';

class DoctorState {}

final class DoctorInitial extends DoctorState {}
final class DoctorLoading extends DoctorState {}
final class DoctorFailure extends DoctorState {
  String error ;

  DoctorFailure(this.error);
}
final class DoctorSuccessful extends DoctorState {
  DoctorModel doctorModel ;

  DoctorSuccessful(this.doctorModel);
}
