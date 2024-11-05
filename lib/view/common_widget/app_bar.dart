import 'package:flutter/material.dart';
import 'package:realestate_admin_app/controller/authentication/auth_provider.dart';
import 'package:realestate_admin_app/utils/app_colors.dart';
import 'package:realestate_admin_app/utils/image_path/image_path.dart';
import 'package:realestate_admin_app/view/common_widget/logout_method.dart';

AppBar appBar(BuildContext context, AuthProvider authProvider) {
  return AppBar(
    leading: Image.asset(ImgPath.homeLogo),
    titleSpacing: 5,
    backgroundColor: Colors.black,
    title: const Text(
      "Real Estate",
      style: AppTextstyle.appName,
    ),
    actions: [
      IconButton(
          onPressed: () {
            showLogoutDialog(context, authProvider);
          },
          icon: const Icon(
            Icons.logout,
            color: AppColors.primary,
          ))
    ],
  );
}
