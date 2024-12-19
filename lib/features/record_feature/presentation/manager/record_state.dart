part of 'record_cubit.dart';

@immutable
sealed class RecordState {}

final class RecordInitial extends RecordState {}
final class SetRecordLoadingState extends RecordState {}
final class SetRecordSuccessState extends RecordState {}
final class SetRecordFailState extends RecordState {
  final String message;
  SetRecordFailState(this.message);
}
