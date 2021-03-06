// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB52MTNaRbtgUuGvVghdjl37aNlZf3EYIM',
    appId: '1:1031045863009:web:82a3e1a72a44687426bc20',
    messagingSenderId: '1031045863009',
    projectId: 'sajad-ai',
    authDomain: 'sajad-ai.firebaseapp.com',
    storageBucket: 'sajad-ai.appspot.com',
    measurementId: 'G-4S49FPJX7B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA36FgmpDW45F4dUzs8K71TfvUglIXv0iY',
    appId: '1:1031045863009:android:772240b7e3c3aa6326bc20',
    messagingSenderId: '1031045863009',
    projectId: 'sajad-ai',
    storageBucket: 'sajad-ai.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCBUUs47gfYHghVhprwD0tBUfGfllENMis',
    appId: '1:1031045863009:ios:d070057e3c9b6b1d26bc20',
    messagingSenderId: '1031045863009',
    projectId: 'sajad-ai',
    storageBucket: 'sajad-ai.appspot.com',
    iosClientId: '1031045863009-m9cf422s4b1gfcugc03ejnjci1aob0jk.apps.googleusercontent.com',
    iosBundleId: 'com.example.testFirebase',
  );
}
