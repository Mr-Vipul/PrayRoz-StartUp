import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart';

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
        return macOS;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBj0mJ15vRcj_QIpyJCqxdXcknn_Xc2bFw',
    appId: '1:855991807023:web:ecad7b9f5b88c029776ada',
    messagingSenderId: '855991807023',
    projectId: 'prayroz-47c64',
    authDomain: 'prayroz-47c64.firebaseapp.com',
    storageBucket: 'prayroz-47c64.firebasestorage.app',
    measurementId: 'G-KX0YZ6QCN8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA9Od8N1fVsrZX-l5f2dohehZx3Yts1XEY',
    appId: '1:855991807023:android:4785f1b066f7d370776ada',
    messagingSenderId: '855991807023',
    projectId: 'prayroz-47c64',
    storageBucket: 'prayroz-47c64.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBua68gca85hgWUT425OHCHm-svfjKDpHE',
    appId: '1:855991807023:ios:6d03f9e651a90cb2776ada',
    messagingSenderId: '855991807023',
    projectId: 'prayroz-47c64',
    storageBucket: 'prayroz-47c64.firebasestorage.app',
    androidClientId: '855991807023-tu2u3s0625m71fvqupjeumlr3n8ih62c.apps.googleusercontent.com',
    iosClientId: '855991807023-nf0flhfta8lksu6cd71s021aa3399tvq.apps.googleusercontent.com',
    iosBundleId: 'com.example.prayroz',
  );

  static const FirebaseOptions macOS = FirebaseOptions(
    apiKey: 'your-macos-api-key',
    appId: 'your-macos-app-id',
    messagingSenderId: 'your-macos-sender-id',
    projectId: 'your-macos-project-id',
    storageBucket: 'your-macos-storage-bucket',
    iosClientId: 'your-macos-client-id',
    iosBundleId: 'your-macos-bundle-id',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'your-windows-api-key',
    appId: 'your-windows-app-id',
    messagingSenderId: 'your-windows-sender-id',
    projectId: 'your-windows-project-id',
    storageBucket: 'your-windows-storage-bucket',
  );


  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'your-linux-api-key',
    appId: 'your-linux-app-id',
    messagingSenderId: 'your-linux-sender-id',
    projectId: 'your-linux-project-id',
    storageBucket: 'your-linux-storage-bucket',
  );
}