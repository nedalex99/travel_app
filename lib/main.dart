import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/login/login_screen.dart';
import 'package:travel_app/ui/welcome/welcome_screen.dart';
import 'package:travel_app/utils/constants/bindings.dart';
import 'package:travel_app/utils/constants/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: DataBindings(),
      theme: kMainTheme,
      home: WelcomeScreen(),
    );
  }
}
