// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:realestate_admin_app/utils/image_path/image_path.dart';
// import 'package:realestate_admin_app/view/logn_screen/login_screen.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(
//         const Duration(seconds: 3),
//         () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => LoginScreen()),
//             ));
//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//             child: Image.asset(
//           ImgPath.homeLogo,
//         )),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:realestate_admin_app/controller/property_page/property_provider.dart';
import 'package:realestate_admin_app/utils/image_path/image_path.dart';
import 'package:realestate_admin_app/view/bottom_navbar/bottom_nav.dart';
import 'package:realestate_admin_app/view/logn_screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.fetchUsers();
      provider.fetchProperties();
    });
    // Check if user is already logged in
    Future.delayed(const Duration(seconds: 3), () {
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // User is signed in, navigate to HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNav()),
        );
      } else {
        // User is not signed in, navigate to LoginScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });

    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Image.asset(ImgPath.homeLogo),
        ),
      ),
    );
  }
}
