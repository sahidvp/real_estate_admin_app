import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:realestate_admin_app/controller/property_page/property_provider.dart';
import 'package:realestate_admin_app/utils/app_colors.dart';

Row rowOne(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Column(
            children: [
              Text(
                "${context.watch<PropertyProvider>().totalUsers}",
                style: AppTextstyle.countText,
              ),
              Text(
                "Total no users",
                style: AppTextstyle.countText2,
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Text(
                "${context.watch<PropertyProvider>().totalProperties}",
                style: AppTextstyle.countText,
              ),
              Text(
                "Total no Properties",
                style: AppTextstyle.countText2,
              )
            ],
          ),
        )
      ],
    );
  }