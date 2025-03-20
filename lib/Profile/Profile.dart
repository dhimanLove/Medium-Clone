import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediumm/Profile/Setting.dart'; // Note: Possible typo in 'etting', should it be 'settings'?
import 'package:mediumm/theme/Apptheme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // Cache frequently used values
    final theme = AppThemes.darkTheme;
    final textTheme = theme.textTheme;
    final screenHeight = Get.height;
    final screenWidth = Get.width;

    return Theme(
      data: theme,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(), // Prevents overscroll glow
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  SizedBox(height: screenHeight * 0.01),
                  _buildProfileInfo(screenHeight, screenWidth, textTheme),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () => Get.to(() => const SettingsScreen()),
        icon: const Icon(Icons.settings),
        splashRadius: 20,
      ),
    );
  }

  Widget _buildProfileInfo(double height, double width, TextTheme textTheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height * 0.123,
          width: width * 0.27,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle, // More efficient than BorderRadius.circular(50)
          ),
        ),
        const SizedBox(width: 20),
        Expanded( // Prevents overflow on smaller screens
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Loveraj Dhiman',
                    style: textTheme.displayLarge,
                  ),
                  const SizedBox(width: 8), // Consistent spacing
                  Text(
                    'he/him',
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '1 Follower',
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 30),
                  Text(
                    '21 Following',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}