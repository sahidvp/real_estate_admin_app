import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate_admin_app/controller/property_page/property_provider.dart';
import 'package:realestate_admin_app/utils/app_colors.dart';

class CategoryButton extends StatelessWidget {
  final double sb;
  final List<String> category; // Assuming category is a list of strings

  CategoryButton({
    super.key,
    required this.sb,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    // Access the CategoryProvider
    final propertProvider = Provider.of<PropertyProvider>(context);

    return Container(
      height: sb * .5,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) {
          bool isSelected = propertProvider.selectedIndex == index;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                // Update the selected index in the provider
                propertProvider.updateSelectedIndex(index);
              },
              child: Container(
                width: sb * 1.5,
                height: sb * .5,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : Colors.grey, // Change color based on selection
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    category[index],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
