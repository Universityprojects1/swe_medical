import 'package:dartz/dartz.dart';
import 'package:swe_medical/core/api/fire_base_helper.dart';
import 'package:swe_medical/core/utils/helper.dart';
import 'package:swe_medical/features/auth_feature/data/model/request/UserRequest.dart';
import 'package:swe_medical/features/record_feature/data/repo/record_repo.dart';

import '../../../../core/erorr/failure.dart';
import '../../../../core/utils/Model/PatientModel.dart';

class  RecordRepoImpl implements RecordRepo {


  RecordRepoImpl();

  @override
  Future<Either<Failure, String>> setRecord(HealthRecord record,String uId) async {
    try {
        FireBaseHelper.docRefForPatientFireStore(uId, UserRequest()).update({
          "isAddHealthRecord": true,
          "healthRecord": record.toJson()
        });
        Helper.returnUser().isHeAssignHealthRecord=true;
        Helper.returnUser().healthRecord=record;
        Helper.returnUser().save();

      return right("success");
    }  catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}