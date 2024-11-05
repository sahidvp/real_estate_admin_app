import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:realestate_admin_app/controller/property_page/property_provider.dart';
import 'package:realestate_admin_app/utils/image_path/image_path.dart';

Expanded allUsers() {
  return Expanded(
    flex: 2,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Consumer<PropertyProvider>(
        builder: (context, provider, child) {
          if (provider.allUsers.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              final user = provider.allUsers[index];
              return ListTile(
                leading: user['imageUrl'] == null
                    ? ClipOval(
                        child: SvgPicture.asset(
                          ImgPath.userTemp,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipOval(
                        child: Image.network(
                          user['imageUrl'],
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                title: Text(
                  user['userName'],
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                // trailing: IconButton(
                //   onPressed: () {},
                //   icon: const Icon(
                //     Icons.block_sharp,
                //     color: Colors.red,
                //   ),
                // ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: provider.allUsers.length,
          );
        },
      ),
    ),
  );
}
