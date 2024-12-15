import 'package:dartz/dartz.dart';
import 'package:swe_medical/core/erorr/failure.dart';

abstract class AuthRepo{
Future<Either<Failure,String>> signUp(String email, String password);



}