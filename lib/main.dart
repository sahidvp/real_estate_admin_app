import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realestate_admin_app/controller/authentication/auth_provider.dart';
import 'package:realestate_admin_app/controller/nav_bar/navbar_provider.dart';
import 'package:realestate_admin_app/controller/property_page/property_provider.dart';
import 'package:realestate_admin_app/utils/app_theme.dart';
import 'package:realestate_admin_app/view/bottom_navbar/bottom_nav.dart';
import 'package:realestate_admin_app/view/home_screen/home_page.dart';
import 'package:realestate_admin_app/view/logn_screen/login_screen.dart';
import 'package:realestate_admin_app/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      // Use MultiProvider to provide multiple ChangeNotifiers
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavigationProvider()),
        ChangeNotifierProvider(create: (context) => PropertyProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Real estate admin",
      theme: Apptheme.myTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/bottomNavBar': (context) => const BottomNav(),
        '/adminHome': (context) => const HomePage(),
        '/loginScreen': (context) => LoginScreen(),
      },
    );
  }
}
