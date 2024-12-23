import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swe_medical/core/api/fire_base_helper.dart';
import 'package:swe_medical/core/cache/hive/hive_keyes.dart';
import 'package:swe_medical/core/cache/hive/hive_manager.dart';
import 'package:swe_medical/core/cache/storage_token.dart';
import 'package:swe_medical/core/erorr/failure.dart';
import 'package:swe_medical/core/utils/Model/PatientModel.dart';
import 'package:swe_medical/features/auth_feature/data/model/request/UserRequest.dart';
import 'package:swe_medical/features/auth_feature/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  FirebaseAuth firebaseAuth;
  StorageToken storageToken;
  HiveManager hiveManager;
  FirebaseFirestore fireBaseFireStore;

  AuthRepoImpl(this.firebaseAuth, this.storageToken, this.fireBaseFireStore,
      this.hiveManager);

  @override
  Future<Either<Failure, String>> signUp(UserRequest userRequest) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: userRequest.email ?? "",
        password: userRequest.password ?? "",
      );
      await storageToken.setToken(credential.user!.uid);
      setDataToFireStore(credential, userRequest);

      return right(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(ServerFailure("The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        return left(
            ServerFailure("The account already exists for that email."));
      } else {
        return left(ServerFailure(e.toString()));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  void setDataToFireStore(UserCredential credential, UserRequest userRequest) {
    var docRef = fireBaseFireStore
        .collection("Patients")
        .withConverter<UserRequest>(
            fromFirestore: (snapshot, options) =>
                UserRequest.fromJson(snapshot),
            toFirestore: (userRequest, options) => userRequest.toJson())
        .doc(credential.user?.uid);
    docRef.set(userRequest);
  }

  @override
  Future<Either<Failure, PatientModel>> signIn(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await storageToken.setToken(credential.user!.uid);
     var data= await getPatientAllDataAndCachingIt(credential.user!.uid);

      return right(data);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(ServerFailure("No user found for that email."));
      } else if (e.code == 'wrong-password') {
        return left(ServerFailure("Wrong password provided for that user."));
      } else {
        return left(ServerFailure(e.toString()));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<PatientModel> getPatientAllDataAndCachingIt(String uID) async {
     final docSnap = await FireBaseHelper.docRefForPatientFireStore(
            uID, UserRequest())
        .get();
    final patientModel = docSnap.data();
    var patientData =  PatientModel(
        name: patientModel?.name??"",
        email: patientModel?.email??"",
        phone: patientModel?.mobile??"",
        isHeAssignHealthRecord: patientModel?.isAddHealthRecord??true,
        patientId: uID
    );
    hiveManager.cacheData<PatientModel>(
        boxKey: HiveKeys.patientBox,
        dataItem: patientData);
    return patientData;

  }
}
