import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:realestate_admin_app/view/common_widget/app_bar.dart';
import 'package:realestate_admin_app/view/common_widget/search_field.dart';
import 'package:realestate_admin_app/view/users_page/all_users.dart';

import '../../controller/authentication/auth_provider.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          appBar: appBar(context, authProvider),
          body: Column(
            children: [
              searchField("Search by users", context),
              SizedBox(
                height: 20,
              ),
              allUsers()
            ],
          )),
    );
  }
}
