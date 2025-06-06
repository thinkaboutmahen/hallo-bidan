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
    apiKey: 'AIzaSyB8k-zVTyqFLk-im3eyDpIUPaHuuEYte1c',
    appId: '1:385897007012:web:55693f33f02213f06b2331',
    messagingSenderId: '385897007012',
    projectId: 'halobidan-fbd91',
    authDomain: 'halobidan-fbd91.firebaseapp.com',
    storageBucket: 'halobidan-fbd91.appspot.com',
    measurementId: 'G-5PWTYCQZ9B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBslM6hFN1Wp5kGCTIJAIxXBI-keYKymfM',
    appId: '1:385897007012:android:d8cfdb86ad5de0946b2331',
    messagingSenderId: '385897007012',
    projectId: 'halobidan-fbd91',
    storageBucket: 'halobidan-fbd91.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6YT8_a1aa6NVLX84edJmwihZrF1YFGX0',
    appId: '1:385897007012:ios:4f412c49dd189e9d6b2331',
    messagingSenderId: '385897007012',
    projectId: 'halobidan-fbd91',
    storageBucket: 'halobidan-fbd91.appspot.com',
    iosBundleId: 'com.example.haloBidan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6YT8_a1aa6NVLX84edJmwihZrF1YFGX0',
    appId: '1:385897007012:ios:4f412c49dd189e9d6b2331',
    messagingSenderId: '385897007012',
    projectId: 'halobidan-fbd91',
    storageBucket: 'halobidan-fbd91.appspot.com',
    iosBundleId: 'com.example.haloBidan',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB8k-zVTyqFLk-im3eyDpIUPaHuuEYte1c',
    appId: '1:385897007012:web:ab6f8bd7f5ce96f86b2331',
    messagingSenderId: '385897007012',
    projectId: 'halobidan-fbd91',
    authDomain: 'halobidan-fbd91.firebaseapp.com',
    storageBucket: 'halobidan-fbd91.appspot.com',
    measurementId: 'G-RKN3E1XTEK',
  );
}
