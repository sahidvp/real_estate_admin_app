import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:provider/provider.dart';
import 'package:realestate_admin_app/utils/media_query.dart';

import 'package:realestate_admin_app/view/common_widget/app_bar.dart';
import 'package:realestate_admin_app/view/common_widget/search_field.dart';
import 'package:realestate_admin_app/view/home_screen/widgets/recent_properties.dart';
import 'package:realestate_admin_app/view/property_page/widgets/category_button.dart';

import '../../controller/authentication/auth_provider.dart';

class PropertyPage extends StatelessWidget {
  const PropertyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sh = Responsive(context).getHeightpercentage(100);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context, authProvider),
        body: Padding(
          padding: EdgeInsets.only(left: 15),
          child: Column(
            children: [
              searchField("Search properties",context),
              SizedBox(height: sh * .02),
              SizedBox(height: sh * .02),
              recentProperties(false)
            ],
          ),
        ),
      ),
    );
  }
}
