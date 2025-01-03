import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:swe_medical/core/cache/storage_token.dart';
import 'package:swe_medical/features/auth_feature/presentation/manger/auth_cubit.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/data/repo/patient_repo_impl.dart';
import 'package:swe_medical/features/record_feature/data/repo/record_repo.dart';
import 'package:swe_medical/features/record_feature/data/repo/record_repo_impl.dart';

import '../../features/auth_feature/data/repo/auth_repo.dart';
import '../../features/auth_feature/data/repo/auth_repo_impl.dart';
import '../../features/home_feature/presentation/patient/data/repo/patient_home_repo.dart';
import '../cache/hive/hive_manager.dart';

final getIt = GetIt.instance;

void setup() {
getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
getIt.registerSingleton<StorageToken>(StorageToken());
getIt.registerSingleton<HiveManager>(HiveManager());
getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt<FirebaseAuth>(),getIt<StorageToken>(),getIt<FirebaseFirestore>(),getIt<HiveManager>()));
getIt.registerSingleton<RecordRepo>(RecordRepoImpl());
getIt.registerSingleton<PatientHomeRepo>(PatientHomeRepoImpl());






}