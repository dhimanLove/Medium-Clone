import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediumm/theme/Apptheme.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  void switchToLightTheme() {
    Get.changeTheme(AppThemes.lightTheme);
    themeMode.value = ThemeMode.light;
  }

  void switchToDarkTheme() {
    Get.changeTheme(AppThemes.darkTheme);
    themeMode.value = ThemeMode.dark;
  }

  void switchToSystemTheme() {
    Get.changeThemeMode(ThemeMode.system);
    themeMode.value = ThemeMode.system;
  }
}