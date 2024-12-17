import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:swe_medical/core/cache/storage_token.dart';
import 'package:swe_medical/features/auth_feature/presentation/manger/auth_cubit.dart';

import '../../features/auth_feature/data/repo/auth_repo.dart';
import '../../features/auth_feature/data/repo/auth_repo_impl.dart';
import '../cache/hive/hive_manager.dart';

final getIt = GetIt.instance;

void setup() {
getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
getIt.registerSingleton<StorageToken>(StorageToken());
getIt.registerSingleton<HiveManager>(HiveManager());

getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt<FirebaseAuth>(),getIt<StorageToken>()));






}