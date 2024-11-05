import 'package:flutter/material.dart';
import 'package:realestate_admin_app/utils/app_colors.dart';

TextField formField(
    String label, TextEditingController textcontroller, bool ispassword) {
  return TextField(
    
    controller: textcontroller,
    obscureText: ispassword,
    style: TextStyle(color: Colors.grey),
    decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.primary)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.circular(15) // Focused color
            ),
        labelText: label,
        labelStyle: AppTextstyle.formFieldText),
  );
}
