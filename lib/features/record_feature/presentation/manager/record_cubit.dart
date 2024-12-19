import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swe_medical/core/utils/Model/PatientModel.dart';
import 'package:swe_medical/features/record_feature/data/repo/record_repo.dart';

import '../../../../core/utils/enums/gender_enum.dart';

part 'record_state.dart';

class RecordCubit extends Cubit<RecordState> {
  RecordRepo recordRepo;

  RecordCubit(this.recordRepo) : super(RecordInitial());
  int height = 0;
  int weight = 0;
  int age = 0;
  String gender = Gender.female.name;
  String bloodType = "A";

  setRecord(String uId) async {
    emit(SetRecordLoadingState());
    final result = await recordRepo.setRecord(
        HealthRecord(
          height: height,
          weight: weight,
          age: age.toString(),
          bloodType: bloodType,
          gender: gender,
        ),
        uId);
    result.fold(
      (l) {
        emit(SetRecordFailState(l.message));
      },
      (r) {
        emit(SetRecordSuccessState());
      },
    );
  }
}
