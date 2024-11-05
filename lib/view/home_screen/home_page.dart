import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate_admin_app/controller/authentication/auth_provider.dart';
import 'package:realestate_admin_app/controller/property_page/property_provider.dart';
import 'package:realestate_admin_app/utils/app_colors.dart';
import 'package:realestate_admin_app/utils/image_path/image_path.dart';
import 'package:realestate_admin_app/utils/media_query.dart';
import 'package:realestate_admin_app/view/common_widget/app_bar.dart';
import 'package:realestate_admin_app/view/common_widget/logout_method.dart';
import 'package:realestate_admin_app/view/home_screen/widgets/recent_properties.dart';

import 'widgets/recent_users.dart';
import 'widgets/row_one.dart';
import 'widgets/row_two.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sh = Responsive(context).getHeightpercentage(100);
    final sw = Responsive(context).getWidthpercentage(100);
    final SizedBox szbx = SizedBox(
      height: sh * .03,
    );

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, authProvider),
        body: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(height: 1, color: Colors.grey),
              rowOne(context),
              rowTwo(context),
              SizedBox(
                height: sh * .05,
              ),
              const Text(
                "Recently Logged users",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              szbx,
              recentUsers(),
              szbx,
              recentProperties(true)
            ],
          ),
        ),
      ),
    );
  }
}
