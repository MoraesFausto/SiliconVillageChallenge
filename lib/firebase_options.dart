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
    apiKey: 'AIzaSyBwKnEookBKTzstTv95-biSlvJNS6Bbhzw',
    appId: '1:445398913897:web:3d400c5b4b8ba1d152e3f8',
    messagingSenderId: '445398913897',
    projectId: 'silicon-village-challenge',
    authDomain: 'silicon-village-challenge.firebaseapp.com',
    storageBucket: 'silicon-village-challenge.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5ahqR_q7GHT_wCmoHbek2QORQTLDJcJo',
    appId: '1:445398913897:android:874f43f136e2b31052e3f8',
    messagingSenderId: '445398913897',
    projectId: 'silicon-village-challenge',
    storageBucket: 'silicon-village-challenge.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyASkPFJVCgPcghSYmR3TaTHNEkW_WMf5Wo',
    appId: '1:445398913897:ios:0928a592429241bb52e3f8',
    messagingSenderId: '445398913897',
    projectId: 'silicon-village-challenge',
    storageBucket: 'silicon-village-challenge.appspot.com',
    iosClientId: '445398913897-thit2du0b2uhueo979dod34mne80eqm6.apps.googleusercontent.com',
    iosBundleId: 'com.example.challengeproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyASkPFJVCgPcghSYmR3TaTHNEkW_WMf5Wo',
    appId: '1:445398913897:ios:0928a592429241bb52e3f8',
    messagingSenderId: '445398913897',
    projectId: 'silicon-village-challenge',
    storageBucket: 'silicon-village-challenge.appspot.com',
    iosClientId: '445398913897-thit2du0b2uhueo979dod34mne80eqm6.apps.googleusercontent.com',
    iosBundleId: 'com.example.challengeproject',
  );
}
