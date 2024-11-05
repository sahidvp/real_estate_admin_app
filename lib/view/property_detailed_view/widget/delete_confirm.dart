import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate_admin_app/controller/property_page/property_provider.dart';
import 'package:realestate_admin_app/view/snack_bar/suceess_snackbar.dart';

void showDeleteConfirmation(BuildContext context, String propertyId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirm Deletion"),
        content: const Text("Are you sure you want to delete this property?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              await Provider.of<PropertyProvider>(context, listen: false)
                  .deleteProperty(propertyId);

              showSuccessSnackbar(context, "Success", "Property removed");

              // Close the dialog after deletion
              Navigator.of(context).pop();
            },
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}
