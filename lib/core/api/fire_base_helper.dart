import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swe_medical/core/di/service_locator.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/data/model/AppointmentModel.dart';

import '../../features/auth_feature/data/model/request/UserRequest.dart';

class FireBaseHelper {
  static FirebaseAuth firebaseAuth = getIt<FirebaseAuth>();
  static FirebaseFirestore fireBaseFireStore = getIt<FirebaseFirestore>();

  static DocumentReference<UserRequest> docRefForPatientFireStore(
      String uId, UserRequest userRequest) {
    var docRef = fireBaseFireStore
        .collection("Patients")
        .withConverter<UserRequest>(
            fromFirestore: (snapshot, options) =>
                UserRequest.fromJson(snapshot),
            toFirestore: (userRequest, options) => userRequest.toJson())
        .doc(uId);
    return docRef;
  }

  static DocumentReference<AppointmentModel> docRefForAppointmentToFireStore(
      String dateTime, AppointmentModel appointmentModel) {
    var docRef = fireBaseFireStore
        .collection("Appointments")
        .withConverter<AppointmentModel>(
          fromFirestore: (snapshot, options) =>
              AppointmentModel.fromJson(snapshot),
          toFirestore: (value, options) => value.toJson(),
        )
        .doc(dateTime);
    return docRef;
  }
  static CollectionReference<AppointmentModel> collectionRefForAppointmentFromFireStore(
      AppointmentModel appointmentModel) {
    var docRef = fireBaseFireStore
        .collection("Appointments")
        .withConverter<AppointmentModel>(
      fromFirestore: (snapshot, options) =>
          AppointmentModel.fromJson(snapshot),
      toFirestore: (value, options) => value.toJson(),
    );

    return docRef;
  }
}
