import 'package:dartz/dartz.dart';
import 'package:swe_medical/core/erorr/failure.dart';
import 'package:swe_medical/core/utils/Model/PatientModel.dart';

abstract class RepoProfile {
  Future<Either<Failure, PatientModel>> getProfileData();

  Future<Either<Failure, String>> updateProfileData(
      PatientModel patientModel);
}
