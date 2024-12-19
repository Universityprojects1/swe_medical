import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swe_medical/core/di/service_locator.dart';

import '../../features/auth_feature/data/model/request/UserRequest.dart';

class FireBaseHelper{
  static FirebaseAuth firebaseAuth=getIt<FirebaseAuth>();
  static FirebaseFirestore fireBaseFireStore=getIt<FirebaseFirestore>();
  static  DocumentReference<UserRequest>  docRefForPatientFireStore(String uId, UserRequest userRequest) {
    var docRef = fireBaseFireStore
        .collection("Patients")
        .withConverter<UserRequest>(
        fromFirestore: (snapshot, options) =>
            UserRequest.fromJson(snapshot),
        toFirestore: (userRequest, options) => userRequest.toJson()).doc(uId);
    return docRef;
  }


}