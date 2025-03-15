import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediumm/Home/HOme.dart';
import 'package:mediumm/Widgets/bottomnavbar.dart';
import 'package:mediumm/theme/Apptheme.dart';// Import the theme file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      home: GoogleNav(),
    );
  }
}
