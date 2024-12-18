import 'package:dartz/dartz.dart';
import 'package:swe_medical/core/erorr/failure.dart';
import 'package:swe_medical/core/utils/Model/PatientModel.dart';
import 'package:swe_medical/features/auth_feature/data/model/request/UserRequest.dart';

abstract class AuthRepo{
Future<Either<Failure,String>> signUp(UserRequest userRequest);
Future<Either<Failure,PatientModel>> signIn(String email, String password);



}