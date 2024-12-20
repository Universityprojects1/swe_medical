import 'package:dartz/dartz.dart';
import 'package:swe_medical/core/erorr/failure.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/data/model/AppointmentModel.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/data/repo/patient_home_repo.dart';

import '../../../../../../core/api/fire_base_helper.dart';

class PatientHomeRepoImpl implements PatientHomeRepo {
  @override
  Future<Either<Failure, String>> addAppointment(AppointmentModel appointmentModel)async {
try{
   var docRef = FireBaseHelper.docRefForAppointmentFireStore(appointmentModel.dateTime??"", appointmentModel);
   await docRef.set(appointmentModel);
  return const Right("Appointment Added Successfully");

}
catch(e){
  return Left(ServerFailure(e.toString()));
}
  }

}