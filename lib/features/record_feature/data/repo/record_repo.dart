import 'package:dartz/dartz.dart';
import 'package:swe_medical/core/erorr/failure.dart';
import 'package:swe_medical/core/utils/Model/PatientModel.dart';

abstract class RecordRepo{

  Future<Either<Failure,String>> setRecord( HealthRecord record,String uId);

}