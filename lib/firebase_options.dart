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
        return macos;
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
    apiKey: 'AIzaSyDJR9MR00kRtq4UhU-QfCe34roydaIGUU4',
    appId: '1:449417377323:web:3511386c6484f2a47b5c6e',
    messagingSenderId: '449417377323',
    projectId: 'instagram-riverpod-valdad',
    authDomain: 'instagram-riverpod-valdad.firebaseapp.com',
    storageBucket: 'instagram-riverpod-valdad.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTcN7WAsz4nl1bTd0ocQ5i0X8atd7qlr4',
    appId: '1:449417377323:android:b6b537cf66cbe4947b5c6e',
    messagingSenderId: '449417377323',
    projectId: 'instagram-riverpod-valdad',
    storageBucket: 'instagram-riverpod-valdad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8Ug3crm7Q2WBdjXqQKlrpD9eTOU6vT4A',
    appId: '1:449417377323:ios:30ba698a7892e4d97b5c6e',
    messagingSenderId: '449417377323',
    projectId: 'instagram-riverpod-valdad',
    storageBucket: 'instagram-riverpod-valdad.appspot.com',
    iosClientId: '449417377323-i9kgk32g4h6j3d2ne8e8s0vdc1ans4vk.apps.googleusercontent.com',
    iosBundleId: 'com.example.riverpodProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8Ug3crm7Q2WBdjXqQKlrpD9eTOU6vT4A',
    appId: '1:449417377323:ios:30ba698a7892e4d97b5c6e',
    messagingSenderId: '449417377323',
    projectId: 'instagram-riverpod-valdad',
    storageBucket: 'instagram-riverpod-valdad.appspot.com',
    iosClientId: '449417377323-i9kgk32g4h6j3d2ne8e8s0vdc1ans4vk.apps.googleusercontent.com',
    iosBundleId: 'com.example.riverpodProject',
  );
}
