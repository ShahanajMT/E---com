import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tstore/data/repositories/authentication/authentication_repo.dart';

import 'app.dart';
import 'firebase_options.dart';

//-----ENTRY POINT OF APPLICATION ------//

Future<void> main() async {
  //!: Add Widget Bindings
  final WidgetsBinding widgetsBinding =  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  //!: Init LocalStorage
  await GetStorage.init();
  //!: Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //!: Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  //!: Initialize Authentication

  runApp(const MyApp());
}
