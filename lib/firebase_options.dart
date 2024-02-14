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
    apiKey: 'AIzaSyCgr6giwdmEplFJy0-tqzUjRTms2nn6u-8',
    appId: '1:525017736686:web:eb36f112bf7cbfa28bdaff',
    messagingSenderId: '525017736686',
    projectId: 'chatapp-b3e2b-flutter',
    authDomain: 'chatapp-b3e2b-flutter.firebaseapp.com',
    storageBucket: 'chatapp-b3e2b-flutter.appspot.com',
    measurementId: 'G-81SJBDR48Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-5zfc23CksmZ3DtrHmaPfkdRUN6Hrxo8',
    appId: '1:525017736686:android:4cd59b38c904e7068bdaff',
    messagingSenderId: '525017736686',
    projectId: 'chatapp-b3e2b-flutter',
    storageBucket: 'chatapp-b3e2b-flutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBnuLK75kxG92suSg5NDlZEwaG3QauBB-A',
    appId: '1:525017736686:ios:4250f4505ae09bfc8bdaff',
    messagingSenderId: '525017736686',
    projectId: 'chatapp-b3e2b-flutter',
    storageBucket: 'chatapp-b3e2b-flutter.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBnuLK75kxG92suSg5NDlZEwaG3QauBB-A',
    appId: '1:525017736686:ios:e32734ff3bf5be648bdaff',
    messagingSenderId: '525017736686',
    projectId: 'chatapp-b3e2b-flutter',
    storageBucket: 'chatapp-b3e2b-flutter.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
