import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color.fromARGB(222, 82, 139, 38);
  static const Color iconPrimary = Colors.black;
}

class AppTextstyle {
  static const TextStyle splasLogo = TextStyle(color: AppColors.primary);
  static const TextStyle formFieldText = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle appName = TextStyle(
      color: Color.fromARGB(222, 144, 244, 68),
      fontWeight: FontWeight.bold,
      fontSize: 26);
  static const TextStyle countText =
      TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w500);
  static const TextStyle countText2 =
      TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500);
  static const TextStyle propTittle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );
}
