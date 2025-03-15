import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediumm/Home/HOme.dart';
import 'package:mediumm/Widgets/bottomnavbar.dart';
import 'package:mediumm/theme/Apptheme.dart';
import 'package:mediumm/theme/Themecontroller.dart';// Import the theme controller

void main() {
  // Initialize the ThemeController
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();

    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeController.themeMode.value, // Bind to controller
      home: GoogleNav(), // Assuming this is your bottom nav widget
    ));
  }
}