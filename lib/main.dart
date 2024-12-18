
import 'package:bloc/bloc.dart';

import 'package:device_preview/device_preview.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:swe_medical/config/routes/routes.dart';
import 'package:swe_medical/core/cache/hive/hive_manager.dart';

import 'core/di/service_locator.dart';
import 'core/services/stripe_payment_services/api_keys_constants/apis_constants.dart';
import 'core/services/stripe_payment_services/service/stripe_dio_service.dart';
import 'core/utils/bloc_observer.dart';
import 'firebase_options.dart';


void main() async {



  HiveManager().inti();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  Bloc.observer = MyBlocObserver();
  StripeDioHelper.init();
  Stripe.publishableKey=ApiKeysConst.stripePublishKey;

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: AppRoute.router,
      ),
    );
  }
}
