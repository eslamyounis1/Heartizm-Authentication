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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCVn3E6qEJbnSbWiny4fh00KNmG1zfG0s4',
    appId: '1:109204112359:android:87c2ef3e7ec529d3a6f342',
    messagingSenderId: '109204112359',
    projectId: 'heartizm-ecg-auth',
    storageBucket: 'heartizm-ecg-auth.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjobBpIvl3o3csbw5SK-8Z4TsmEBHgalY',
    appId: '1:109204112359:ios:eb92a7158713adaba6f342',
    messagingSenderId: '109204112359',
    projectId: 'heartizm-ecg-auth',
    storageBucket: 'heartizm-ecg-auth.appspot.com',
    androidClientId: '109204112359-lqi4de5vq3jmbu04qnlbp2ss7pote1op.apps.googleusercontent.com',
    iosClientId: '109204112359-ca1b7h8ijm7a2f1s57uhvj8kuganq087.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecgAuthAppHeartizm',
  );
}
