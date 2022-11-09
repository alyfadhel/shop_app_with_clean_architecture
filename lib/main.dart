import 'package:flutter/material.dart';
import 'package:shop_app_with_clean_architecture/core/resources/theme_manager.dart';
import 'package:shop_app_with_clean_architecture/features/on_boarding/on_boardind_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationLightTheme(),
      home: const OnBoardingScreen(),
    );
  }
}


