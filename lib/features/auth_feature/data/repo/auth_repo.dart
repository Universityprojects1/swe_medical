import 'package:dartz/dartz.dart';
import 'package:swe_medical/core/erorr/failure.dart';
import 'package:swe_medical/features/auth_feature/data/model/request/UserRequest.dart';

abstract class AuthRepo{
Future<Either<Failure,String>> signUp(UserRequest userRequest);
Future<Either<Failure,String>> signIn(String email, String password);



}