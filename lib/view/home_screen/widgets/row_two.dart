 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate_admin_app/controller/property_page/property_provider.dart';
import 'package:realestate_admin_app/utils/app_colors.dart';

Row rowTwo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Column(
            children: [
              Text(
                "${context.watch<PropertyProvider>().rentProperties}",
                style: AppTextstyle.countText,
              ),
              const Text(
                "Rent properties",
                style: AppTextstyle.countText2,
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Text(
                "${context.watch<PropertyProvider>().saleProperties}",
                style: AppTextstyle.countText,
              ),
              const Text(
                "Sale properties",
                style: AppTextstyle.countText2,
              )
            ],
          ),
        )
      ],
    );
  }
