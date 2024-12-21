import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:swe_medical/core/erorr/failure.dart';
import 'package:swe_medical/features/profile_admin/data/model/doctor_model.dart';
import 'package:swe_medical/features/profile_admin/data/repo/repo_doctor.dart';

class RepoDoctorImpl extends RepoDoctor {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, DoctorModel>> getProfileData() async {
    try {
      final docSnapshot = await firebaseFirestore
          .collection("doctor")
          .doc("gTIy17dgtECZvoBR64eA")
          .get();

      if (docSnapshot.exists) {
        final patient =
            DoctorModel.fromJson(docSnapshot.data() as Map<String, dynamic>);
        return right(patient);
      } else {
        return left(ServerFailure("Patient not found"));
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
