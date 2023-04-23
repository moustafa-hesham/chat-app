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
    apiKey: 'AIzaSyDWiEFb0YCSJT441iQtWEJ1klwSQVIVr54',
    appId: '1:793212904347:web:760ac3348a8f1446fff73e',
    messagingSenderId: '793212904347',
    projectId: 'chat-app-647de',
    authDomain: 'chat-app-647de.firebaseapp.com',
    storageBucket: 'chat-app-647de.appspot.com',
    measurementId: 'G-D3ZFV4V1XR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6dOWLE5FWjC_oN4E_0j7llgmOQ7xQLdw',
    appId: '1:793212904347:android:8d67e49faa260f14fff73e',
    messagingSenderId: '793212904347',
    projectId: 'chat-app-647de',
    storageBucket: 'chat-app-647de.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcJs03XTNdpFRZV8pri8NwfSBnYooH0Hg',
    appId: '1:793212904347:ios:3262ed8314b1c0cdfff73e',
    messagingSenderId: '793212904347',
    projectId: 'chat-app-647de',
    storageBucket: 'chat-app-647de.appspot.com',
    iosClientId: '793212904347-5a61jh1r64hs4co9kkearoets60cnpjn.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcJs03XTNdpFRZV8pri8NwfSBnYooH0Hg',
    appId: '1:793212904347:ios:3262ed8314b1c0cdfff73e',
    messagingSenderId: '793212904347',
    projectId: 'chat-app-647de',
    storageBucket: 'chat-app-647de.appspot.com',
    iosClientId: '793212904347-5a61jh1r64hs4co9kkearoets60cnpjn.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
