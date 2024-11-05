// import 'package:flutter/material.dart';
// import 'package:iconsax_plus/iconsax_plus.dart';

// class BottomNav extends StatelessWidget {
//   const BottomNav({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//           unselectedItemColor: Colors.white,
//           backgroundColor: Colors.black,
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   IconsaxPlusBold.buildings,
//                 ),
//                 label: "Properties"),
//             BottomNavigationBarItem(
//                 icon: Icon(IconsaxPlusBold.user), label: "Users")
//           ]),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:provider/provider.dart';
import 'package:realestate_admin_app/controller/nav_bar/navbar_provider.dart';
import 'package:realestate_admin_app/controller/property_page/property_provider.dart';
import 'package:realestate_admin_app/utils/app_colors.dart';
import 'package:realestate_admin_app/view/home_screen/home_page.dart';
import 'package:realestate_admin_app/view/property_page/property_page.dart';
import 'package:realestate_admin_app/view/users_page/users_page.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context, listen: false);
    final List<Widget> _pages = [HomePage(), PropertyPage(), UsersPage()];
     WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.fetchUsers();
      provider.fetchProperties();
    });
    return Consumer<BottomNavigationProvider>(
      builder: (context, navigationProvider, child) {
        return Scaffold(
          body: _pages[navigationProvider.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationProvider.selectedIndex,
            onTap: (index) {
              navigationProvider.updateIndex(index); // Update selected index
            },
            unselectedItemColor: Colors.white,
            selectedItemColor: AppColors.primary,
            backgroundColor: Colors.black,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(IconsaxPlusBold.buildings), label: "Properties"),
              BottomNavigationBarItem(
                  icon: Icon(IconsaxPlusBold.user), label: "Users")
            ],
          ),
        );
      },
    );
  }

  // // Function to return the corresponding page based on the selected index
  // Widget _getPage(int index) {
  //   switch (index) {
  //     case 0:
  //       return HomePage(); // Replace with your HomePage widget
  //     case 1:
  //       return PropertiesPage(); // Replace with your PropertiesPage widget
  //     case 2:
  //       return UsersPage(); // Replace with your UsersPage widget
  //     default:
  //       return HomePage(); // Default page
  //   }
  // }
}
