import 'package:dartz/dartz.dart';
import 'package:swe_medical/core/erorr/failure.dart';
import 'package:swe_medical/features/profile_admin/data/model/doctor_model.dart';
import 'package:swe_medical/features/profile_admin/data/repo/repo_doctor.dart';

class RepoDoctorImpl extends RepoDoctor{
  @override
  Future<Either<Failure, DoctorModel>> getProfileData() {
    // TODO: implement getProfileData
    throw UnimplementedError();
  }

}