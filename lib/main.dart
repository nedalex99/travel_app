import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/ui/login/login_screen.dart';
import 'package:travel_app/utils/constants/bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: DataBindings(),
      home: LoginScreen(),
    );
  }
}
