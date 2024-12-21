import 'package:dartz/dartz.dart';
import 'package:swe_medical/features/profile_admin/data/model/doctor_model.dart';

import '../../../../core/erorr/failure.dart';

abstract class RepoDoctor {
  Future<Either<Failure, DoctorModel>> getProfileData();

}
