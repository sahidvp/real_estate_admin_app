import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:realestate_admin_app/controller/property_page/property_provider.dart';
import 'package:realestate_admin_app/utils/app_colors.dart';
import 'package:realestate_admin_app/view/common_widget/indian_rupee.dart';

import 'widget/delete_confirm.dart';

class PropertyDetails extends StatelessWidget {
  final Map<String, dynamic> property;
  const PropertyDetails({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    
    DateTime uploadDate = (property['timestamp'] as Timestamp).toDate();
    String formattedDate =
        DateFormat('yyyy-MM-dd – hh:mm a').format(uploadDate);
    return Scaffold(
      appBar: AppBar(
        title: Text(property['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  property['imageUrls'][0],
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Title: ${property['title']}",
              style: AppTextstyle.countText2,
            ),
            Text(
              "Category: ${property['category'] ?? 'N/A'}",
              style: AppTextstyle.countText2,
            ),
            Text(
              "Location: ${property['location']}",
              style: AppTextstyle.countText2,
            ),
            Text(
              "Price: ${indianRupee(property['price'])}",
              style: AppTextstyle.countText2,
            ),
            Text(
              "Posted By: ${property['postedBy']}",
              style: AppTextstyle.countText2,
            ),
            Text(
              "Uploaded At: $formattedDate",
              style: AppTextstyle.countText2,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => showDeleteConfirmation(context,property["id"]),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text("Delete Property"),
            ),
          ],
        ),
      ),
    );
  }
}
