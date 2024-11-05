import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:provider/provider.dart';
import 'package:realestate_admin_app/controller/property_page/property_provider.dart';

Container searchField(String hintText, BuildContext context,bool isUser) {
  final provider = Provider.of<PropertyProvider>(context, listen: false);

  return Container(
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(15),
    ),
    child: TextFormField(
      onChanged: (value) {
        isUser?
        provider.searchUsers(value):
        provider.searchProperties(value); // Update the search query
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        prefixIcon: Icon(
          IconsaxPlusLinear.search_normal_1,
          color: Colors.white,
        ),
        contentPadding: EdgeInsets.only(top: 15),
        border: InputBorder.none,
      ),
    ),
  );
}
