import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swe_medical/core/erorr/failure.dart';
import 'package:swe_medical/features/auth_feature/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo{
  FirebaseAuth firebaseAuth;
  AuthRepoImpl(this.firebaseAuth);
  @override
  Future<Either<Failure, String>> signUp(String email, String password) async{
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
      );
      return right(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
       return left(ServerFailure("No user found for that email."));
      } else if (e.code == 'wrong-password') {
        return left(ServerFailure("Wrong password provided for that user."));
      }
      else{
        return left(ServerFailure("Something went wrong"));
      }
    }
    catch (e) {
      return left(ServerFailure("Something went wrong"));
    }
  }

}