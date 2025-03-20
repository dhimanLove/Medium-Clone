import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediumm/Widgets/bottomnavbar.dart';
import 'package:mediumm/theme/Apptheme.dart';
import 'package:mediumm/theme/Themecontroller.dart'; // Import the theme controller

void main() {
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeController.themeMode.value,
      home: GoogleNav(),
    );
  }
}
