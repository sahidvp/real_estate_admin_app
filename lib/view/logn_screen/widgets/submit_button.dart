import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate_admin_app/controller/authentication/auth_provider.dart';
import 'package:realestate_admin_app/utils/app_colors.dart';
import 'package:realestate_admin_app/utils/media_query.dart';

SizedBox sumbitButton(BuildContext context, TextEditingController email,
    TextEditingController password, Responsive responsive) {
  final sw = responsive.getWidthpercentage(50);
  return SizedBox(
    width: sw * 1.5,
    child: ElevatedButton(
      onPressed: () async {
        try {
          // Call the login method from AuthProvider
          await Provider.of<AuthProvider>(context, listen: false).login(
            email.text,
            password.text,
          );
          // Navigate to admin home if login is successful
          Navigator.pushReplacementNamed(context, '/bottomNavBar');
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary, // Background color
        foregroundColor: Colors.black,
        textStyle: TextStyle(fontSize: 20), // Text size
      ),
      child: Text('Login'),
    ),
  );
}
