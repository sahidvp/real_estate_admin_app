import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate_admin_app/controller/property_page/property_provider.dart';
import 'package:realestate_admin_app/view/common_widget/indian_rupee.dart';

import '../../property_detailed_view/property_details.dart';

Expanded recentProperties(bool isRecent) {
  return Expanded(
    flex: 3,
    child: Consumer<PropertyProvider>(
      builder: (context, provider, child) {
        if (provider.allproperties.isEmpty) {
          return Center(child: Text("No properties found."));
        }

        return GridView.builder(
          itemCount: provider.allproperties.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final property = provider.allproperties[index];

            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PropertyDetails(property: property),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 5),
                    Expanded(
                      flex: 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          property['imageUrls'][0],
                          fit: BoxFit.fitWidth,
                          width: 150,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        property['title'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        indianRupee(property['price']),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        property['postedBy'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
