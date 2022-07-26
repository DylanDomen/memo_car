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
      // ignore: no_default_cases
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAKVByJ84lltinA7vw2lQXVxLbBMOOT408',
    appId: '1:521495624291:web:bc04bf9a639ea9f5769656',
    messagingSenderId: '521495624291',
    projectId: 'memo-car',
    authDomain: 'memo-car.firebaseapp.com',
    storageBucket: 'memo-car.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBgvHDciIrOzHjHl9zCjFSGDWZCVy_CR94',
    appId: '1:521495624291:android:6d7a2546c36e31ab769656',
    messagingSenderId: '521495624291',
    projectId: 'memo-car',
    storageBucket: 'memo-car.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5fh9NLSGTYq4pgEPU-G5sW1zHr2SVe5k',
    appId: '1:521495624291:ios:304e967f907f987d769656',
    messagingSenderId: '521495624291',
    projectId: 'memo-car',
    storageBucket: 'memo-car.appspot.com',
    androidClientId:
        '521495624291-rgaplnb9quurbrlml0qlf4jic0jamc86.apps.googleusercontent.com',
    iosClientId:
        '521495624291-nhdh5c6il4sqb183t5k6l1irosrr156n.apps.googleusercontent.com',
    iosBundleId: 'com.example.verygoodcore.memo-car',
  );
}
