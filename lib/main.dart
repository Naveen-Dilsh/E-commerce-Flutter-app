import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/app.dart';

import 'firebase_options.dart';

Future<void> main() async {
  //TODO: Add widgets Binding
  //TODO: Init Local Storage
  //TODO: Init Payment Methods
  //TODO: Await Native Splash

  //TODO: Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  //TODO: Initialize Authentication

  //Load All the material Design / Themes / Localization / Bindings
  runApp(const App());
}
