import 'package:flutter/material.dart';
import 'package:realestate_admin_app/utils/app_colors.dart';

class Apptheme {
  static final ThemeData myTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: AppColors.primary,

    primarySwatch: Colors.lightGreen,
    // Other theme properties
    iconTheme:
        const IconThemeData(color: Color(0x8BC83F)), // Set icon color here
  );
}
