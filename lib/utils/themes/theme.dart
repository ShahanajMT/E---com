import 'package:flutter/material.dart';
import 'package:tstore/utils/themes/custom_theme/appBar_theme.dart';
import 'package:tstore/utils/themes/custom_theme/bottom_sheet_theme.dart';
import 'package:tstore/utils/themes/custom_theme/checkbox_theme.dart';
import 'package:tstore/utils/themes/custom_theme/chip_theme.dart';
import 'package:tstore/utils/themes/custom_theme/elevated_button_theme.dart';
import 'package:tstore/utils/themes/custom_theme/outlined_button_theme.dart';
import 'package:tstore/utils/themes/custom_theme/text_feild_theme.dart';
import 'package:tstore/utils/themes/custom_theme/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: TChipTheme.lightChipTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFeildTheme.lightInputDecorationTheme,
  );

  
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: TChipTheme.darkChipTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFeildTheme.darkInputDecorationTheme,
  );
}
