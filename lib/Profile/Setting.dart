import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediumm/theme/Apptheme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? selectedValue = 'Topics';
  void _showSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppThemes.darkTheme.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            'Select Category',
            style: AppThemes.darkTheme.textTheme.headlineSmall?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Dialogoptions('Dark'),
                Dialogoptions('System Default'),
                Dialogoptions('Light'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey[400]),
              ),
            ),
          ],
        );
      },
    );
  }
  Widget Dialogoptions(String value) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedValue = value;
        });

        // Change theme based on selected option
        if (value == 'Dark') {
          Get.changeTheme(AppThemes.darkTheme);
        } else if (value == 'Light') {
          Get.changeTheme(AppThemes.lightTheme);
        } else if (value == 'System Default') {
          Get.changeThemeMode(ThemeMode.system);
        }

        Get.back();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: selectedValue,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue;
                });

                if (newValue == 'Dark') {
                  Get.changeTheme(AppThemes.darkTheme);
                } else if (newValue == 'Light') {
                  Get.changeTheme(AppThemes.lightTheme);
                } else if (newValue == 'System Default') {
                  Get.changeThemeMode(ThemeMode.system);
                }

                Navigator.pop(context);
              },
              activeColor: Colors.green[700],
            ),
            Text(
              value,
              style: AppThemes.darkTheme.textTheme.bodyLarge?.copyWith(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool switchh = false;

  @override
  Widget build(BuildContext context) {

    return Theme(
      data: AppThemes.darkTheme,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            'Settings',
            style: AppThemes.darkTheme.textTheme.displayLarge?.copyWith(
              fontSize: 20,
            ),
          ),
        ),
        body: ListView(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Account',
                style: AppThemes.darkTheme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Become a Medium member',
                style: AppThemes.darkTheme.textTheme.bodySmall,
              ),
              trailing: const Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Story stats',
                style: AppThemes.darkTheme.textTheme.bodyLarge,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Account',
                style: AppThemes.darkTheme.textTheme.bodyLarge,
              ),
              onTap: () {},
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Configure Medium',
                style: AppThemes.darkTheme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Refine recommendations',
                style: AppThemes.darkTheme.textTheme.bodyLarge,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Theme',
                style: AppThemes.darkTheme.textTheme.bodyLarge,
              ),
              trailing: Text(selectedValue ?? "System Default",
                style: AppThemes.darkTheme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                _showSelectionDialog();
              },
            ),
            ListTile(
              title: Text(
                'Push notifications',
                style: AppThemes.darkTheme.textTheme.bodyLarge,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Email notifications',
                style: AppThemes.darkTheme.textTheme.bodyLarge,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Custom app icon',
                style: AppThemes.darkTheme.textTheme.bodyLarge,
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Downloaded content',
                style: AppThemes.darkTheme.textTheme.bodyLarge,
              ),
              onTap: () {},
            ),

            // Social Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Social',
                style: AppThemes.darkTheme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                'We will never post to X or Facebook without your permission.',
                style: AppThemes.darkTheme.textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Connect X',
                style: AppThemes.darkTheme.textTheme.bodyLarge,
              ),
              trailing: Switch(
                value: switchh,
                onChanged: (bool value) {
                  setState(() {
                    switchh = !switchh;
                  });
                },
                activeColor: Colors.white,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[800],
              ),
              onTap: () {
                setState(() {
                  switchh = !switchh;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}