import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCXRyReOQvZgC6VOQQOHulWF0b7ZfnZsXE',
    appId: '1:727665213288:web:a62bb9b11c757227be20dd',
    messagingSenderId: '727665213288',
    projectId: 'flutter-shopping-app-35860',
    authDomain: 'flutter-shopping-app-35860.firebaseapp.com',
    storageBucket: 'flutter-shopping-app-35860.firebasestorage.app',
    measurementId: 'G-XDSD2Y18QP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2XDyCzxqViDTJhPcXqfZKWPfx7efHy_w',
    appId: '1:727665213288:android:601e011e52d2abafbe20dd',
    messagingSenderId: '727665213288',
    projectId: 'flutter-shopping-app-35860',
    storageBucket: 'flutter-shopping-app-35860.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCCh0WsVOgN_HmkqSbm7rHcLXSOWr1oDBQ',
    appId: '1:727665213288:ios:65f88fec531ce78bbe20dd',
    messagingSenderId: '727665213288',
    projectId: 'flutter-shopping-app-35860',
    storageBucket: 'flutter-shopping-app-35860.firebasestorage.app',
    iosBundleId: 'com.example.firstFlutterProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCCh0WsVOgN_HmkqSbm7rHcLXSOWr1oDBQ',
    appId: '1:727665213288:ios:65f88fec531ce78bbe20dd',
    messagingSenderId: '727665213288',
    projectId: 'flutter-shopping-app-35860',
    storageBucket: 'flutter-shopping-app-35860.firebasestorage.app',
    iosBundleId: 'com.example.firstFlutterProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCXRyReOQvZgC6VOQQOHulWF0b7ZfnZsXE',
    appId: '1:727665213288:web:3f0ce5dba9f0a9dfbe20dd',
    messagingSenderId: '727665213288',
    projectId: 'flutter-shopping-app-35860',
    authDomain: 'flutter-shopping-app-35860.firebaseapp.com',
    storageBucket: 'flutter-shopping-app-35860.firebasestorage.app',
    measurementId: 'G-NH40KQ62W1',
  );
}
