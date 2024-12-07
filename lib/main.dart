import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:swe_medical/config/routes/routes.dart';

import 'core/di/service_locator.dart';
import 'firebase_options.dart';

void main()async {
  setup();
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppRoute.router,
    );
  }
}


