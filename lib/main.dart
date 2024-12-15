import 'package:flutter/material.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Todo Bindings
  // Todo Local Storage
  // Todo native splash

  // ...
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      // .then(FirebaseApp value) => Get.put(AuthenticationRepository());

  //ToDo: Initialize Authentication;
  runApp(const App());
}

