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
    apiKey: 'AIzaSyCWpoNB-FUvPKNYkCbS-i0_g-xwFL_ZKc8',
    appId: '1:649688171330:web:0e161c04e5a1c04869fedb',
    messagingSenderId: '649688171330',
    projectId: 'yourdiary-5c814',
    authDomain: 'yourdiary-5c814.firebaseapp.com',
    storageBucket: 'yourdiary-5c814.firebasestorage.app',
    measurementId: 'G-EVS71180NM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVFRBrWMGDgPmFXGn0KOmWJ-9JOkBZGqw',
    appId: '1:649688171330:android:ec77c06338fbbcc469fedb',
    messagingSenderId: '649688171330',
    projectId: 'yourdiary-5c814',
    storageBucket: 'yourdiary-5c814.firebasestorage.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCSNBL8mCRTxYJqGgcNMc56k8gvxU10FgI',
    appId: '1:649688171330:ios:fa4c537c524431e069fedb',
    messagingSenderId: '649688171330',
    projectId: 'yourdiary-5c814',
    storageBucket: 'yourdiary-5c814.firebasestorage.app',
    iosBundleId: 'com.example.yourdiary2',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSNBL8mCRTxYJqGgcNMc56k8gvxU10FgI',
    appId: '1:649688171330:ios:fa4c537c524431e069fedb',
    messagingSenderId: '649688171330',
    projectId: 'yourdiary-5c814',
    storageBucket: 'yourdiary-5c814.firebasestorage.app',
    iosBundleId: 'com.example.yourdiary2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCWpoNB-FUvPKNYkCbS-i0_g-xwFL_ZKc8',
    appId: '1:649688171330:web:d8b0b62df9d73efe69fedb',
    messagingSenderId: '649688171330',
    projectId: 'yourdiary-5c814',
    authDomain: 'yourdiary-5c814.firebaseapp.com',
    storageBucket: 'yourdiary-5c814.firebasestorage.app',
    measurementId: 'G-NMECFP47ZT',
  );
}
