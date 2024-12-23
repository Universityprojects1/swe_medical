part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoadingState extends AuthState {}
final class AuthErrorState extends AuthState {
  AuthErrorState(this.error);
  final String error;
}
final class AuthSuccessState extends AuthState {
  AuthSuccessState(this.patient);
  final PatientModel patient;
}


