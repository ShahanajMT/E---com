import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tstore/bindings/general_binding.dart';
import 'package:tstore/utils/constants/colors.dart';

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
      initialBinding: GeneralBinding(),
      //! show loader or CPI
      home: const Scaffold(backgroundColor: TColors.primary, body: Center(child: CircularProgressIndicator(color: TColors.white,),),),
    );
  }
}