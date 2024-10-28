import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pfef/firebase_options.dart';
import 'package:pfef/pages/homepage.dart';
import 'package:pfef/pages/signin1.dart';
import 'package:dcdg/dcdg.dart';
import 'package:pfef/pages/transactionpage.dart';

import 'auth/authentificantion.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(authentification()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: homepage(),
    );
  }
}
