import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swe_medical/core/erorr/failure.dart';
import 'package:swe_medical/core/utils/app_string.dart';
import 'package:swe_medical/features/profile_feature/data/repo/repo_profile.dart';

import '../../../../core/utils/Model/PatientModel.dart';

class RepoProfileImpl extends RepoProfile {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, PatientModel>> getProfileData() async {
    try {
      final String uId = _auth.currentUser!.uid;
      final docSnapshot =
          await firebaseFirestore.collection(AppString.patient).doc(uId).get();

      if (docSnapshot.exists) {
        final patient =
            PatientModel.fromJson(docSnapshot.data() as Map<String, dynamic>);
        return right(patient);
      } else {
        return left(ServerFailure("Patient not found"));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateProfileData(
      PatientModel patientModel) async {
    try {
      final String uId = _auth.currentUser!.uid;

      await firebaseFirestore
          .collection(AppString.patient)
          .doc(uId)
          .update(patientModel.toJson());
      return right("Successful");
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
