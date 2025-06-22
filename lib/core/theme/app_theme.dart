import 'package:flutter/material.dart';
import 'package:todo/core/theme/app_color.dart';

class AppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColor.backGroundColor,
    appBarTheme: const AppBarTheme(backgroundColor: AppColor.appBarColor),
    progressIndicatorTheme:const ProgressIndicatorThemeData(
      color: AppColor.appColor,
    ),
  );
}
