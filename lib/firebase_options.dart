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
    apiKey: 'AIzaSyBCv48VVUn5AFRhHOYNgPzj542YwWu1VHY',
    appId: '1:160981436475:web:5a44ca68a0794af4f9f41e',
    messagingSenderId: '160981436475',
    projectId: 'device-streaming-f44426b0',
    authDomain: 'device-streaming-f44426b0.firebaseapp.com',
    storageBucket: 'device-streaming-f44426b0.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrP6MCV4d_MLkOD6gQ2NCeBoDfCqYH0TM',
    appId: '1:160981436475:android:d3913451b9e625dbf9f41e',
    messagingSenderId: '160981436475',
    projectId: 'device-streaming-f44426b0',
    storageBucket: 'device-streaming-f44426b0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUAB9TAFQzw_1NcCGdSrpq6ezhuQN3LfE',
    appId: '1:160981436475:ios:9f124e9cd8c9b7c6f9f41e',
    messagingSenderId: '160981436475',
    projectId: 'device-streaming-f44426b0',
    storageBucket: 'device-streaming-f44426b0.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUAB9TAFQzw_1NcCGdSrpq6ezhuQN3LfE',
    appId: '1:160981436475:ios:9f124e9cd8c9b7c6f9f41e',
    messagingSenderId: '160981436475',
    projectId: 'device-streaming-f44426b0',
    storageBucket: 'device-streaming-f44426b0.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBCv48VVUn5AFRhHOYNgPzj542YwWu1VHY',
    appId: '1:160981436475:web:c665e680cd5b572df9f41e',
    messagingSenderId: '160981436475',
    projectId: 'device-streaming-f44426b0',
    authDomain: 'device-streaming-f44426b0.firebaseapp.com',
    storageBucket: 'device-streaming-f44426b0.firebasestorage.app',
  );
}
