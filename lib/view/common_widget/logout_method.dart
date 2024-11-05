import 'package:flutter/material.dart';
import 'package:realestate_admin_app/controller/authentication/auth_provider.dart';
import 'package:realestate_admin_app/view/logn_screen/login_screen.dart';

void showLogoutDialog(BuildContext context, AuthProvider authProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Close the dialog without logging out
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () async {
                // Perform the logout
                try {
                  await authProvider.logout();

                  // Navigate to the LoginScreen after logging out
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                } catch (e) {
                  // Handle logout error if any
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }