import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/features/authentication/screens/onBoarding_page.dart';

import 'utils/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E - C O M M E R C E',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}