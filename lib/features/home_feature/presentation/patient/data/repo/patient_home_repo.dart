import 'package:dartz/dartz.dart';
import 'package:swe_medical/core/erorr/failure.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/data/model/AppointmentModel.dart';

abstract class PatientHomeRepo{
  Future<Either<Failure,String>> addAppointment(AppointmentModel appointmentModel);
  Future<Either<Failure,List<AppointmentModel>>> getAllAppointment( );


}