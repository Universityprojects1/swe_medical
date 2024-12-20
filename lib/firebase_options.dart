// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB06Smx6LxoYgEyXpOgFtdIs4Ko7fd33TM',
    appId: '1:731767889577:web:01a8ee74d24cc6b0c813b8',
    messagingSenderId: '731767889577',
    projectId: 'swe-mediacl',
    authDomain: 'swe-mediacl.firebaseapp.com',
    storageBucket: 'swe-mediacl.firebasestorage.app',
    measurementId: 'G-0LEP5L2J6D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDx6BCnRcMvEdajZwY6nuo8vjGAvS6lq04',
    appId: '1:731767889577:android:bc37610e4222d59fc813b8',
    messagingSenderId: '731767889577',
    projectId: 'swe-mediacl',
    storageBucket: 'swe-mediacl.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5a3zTkXQol4ZqquyVYuC4TtWsjeQpJok',
    appId: '1:731767889577:ios:fee5b5407aadf3d7c813b8',
    messagingSenderId: '731767889577',
    projectId: 'swe-mediacl',
    storageBucket: 'swe-mediacl.firebasestorage.app',
    iosBundleId: 'com.example.sweMedical',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB5a3zTkXQol4ZqquyVYuC4TtWsjeQpJok',
    appId: '1:731767889577:ios:fee5b5407aadf3d7c813b8',
    messagingSenderId: '731767889577',
    projectId: 'swe-mediacl',
    storageBucket: 'swe-mediacl.firebasestorage.app',
    iosBundleId: 'com.example.sweMedical',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB06Smx6LxoYgEyXpOgFtdIs4Ko7fd33TM',
    appId: '1:731767889577:web:5ce3faa575dc028bc813b8',
    messagingSenderId: '731767889577',
    projectId: 'swe-mediacl',
    authDomain: 'swe-mediacl.firebaseapp.com',
    storageBucket: 'swe-mediacl.firebasestorage.app',
    measurementId: 'G-FH56V9SGYQ',
  );
}
