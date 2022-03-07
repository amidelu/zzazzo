import 'package:delowarhossain/util/custom_theme.dart';
import 'package:delowarhossain/views/screens/landing_page/landing_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      title: 'Delowar Hossain',
      theme: CustomTheme.lightTheme,
      home: LandingPage(),
    );
  }
}
