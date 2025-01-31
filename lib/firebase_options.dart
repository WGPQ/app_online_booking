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
    apiKey: 'AIzaSyCpoU8xrsFED91nWTr2U_vfPZpmWOdqvj8',
    appId: '1:656433935066:web:cd4a0430247b7b77b72be3',
    messagingSenderId: '656433935066',
    projectId: 'login-flutter-9daf8',
    authDomain: 'noti-uper.firebaseapp.com',
    storageBucket: 'noti-uper.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCzaiTMmhtREVHZCy-WCKAJoagOE7Z5mhk',
    appId: '1:638584125590:android:ff0e3b39815843a15deab7',
    messagingSenderId: '638584125590',
    projectId: 'login-flutter-9daf8',
    storageBucket: 'login-flutter-9daf8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwXsvAZTmH1p73Fd5OHostKwiJyOEaWtg',
    appId: '1:638584125590:ios:16bc6c169f58b7705deab7',
    messagingSenderId: '638584125590',
    projectId: 'login-flutter-9daf8',
    storageBucket: 'login-flutter-9daf8.appspot.com',
    iosBundleId: 'com.example.loginGoogle',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAzVzw6oH8HQ2GasNCUil0Lpbn9KtEWw-k',
    appId: '1:656433935066:ios:2c062fc7a1bc15e9b72be3',
    messagingSenderId: '656433935066',
    projectId: 'login-flutter-9daf8',
    storageBucket: 'noti-uper.appspot.com',
    iosBundleId: 'com.example.upertask',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCpoU8xrsFED91nWTr2U_vfPZpmWOdqvj8',
    appId: '1:656433935066:web:b1fc152b3ac32723b72be3',
    messagingSenderId: '656433935066',
    projectId: 'login-flutter-9daf8',
    authDomain: 'noti-uper.firebaseapp.com',
    storageBucket: 'noti-uper.appspot.com',
  );
}
