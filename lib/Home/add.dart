import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediumm/Home/add/Muted.dart';
import 'package:mediumm/Home/add/Suggestion.dart';
import 'package:mediumm/Home/add/readingHistory.dart';
import 'package:mediumm/theme/Apptheme.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  int selectindex = 3;

  @override
  void initState() {
    super.initState();
  }

  Widget contentoftabbar() {
    switch (selectindex) {
      case 0:
        return Center(
          child: Text(
            'Following Content',
            style: AppThemes.darkTheme.textTheme.bodyLarge,
          ),
        );
      case 1:
        return HistoryScreen();
      case 2:
        return Muted();
      case 3:
        return Suggestion();
      default:
        return Center(
          child: Text(
            'Following Content',
            style: AppThemes.darkTheme.textTheme.bodyLarge,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppThemes.darkTheme.appBarTheme.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppThemes.darkTheme.appBarTheme.iconTheme?.color,
          ),
        ),
        title: Text(
          'Refine Recommendations',
          style: AppThemes.darkTheme.textTheme.displayLarge?.copyWith(
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Adjust recommendations by uploading content what you're following, your reading history, and who you're muted",
              style: AppThemes.darkTheme.textTheme.displaySmall,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  tabbutton(0, 'Following'),
                  tabbutton(1, 'Reading History'),
                  tabbutton(2, 'Muted'),
                  tabbutton(3, 'Suggestions'),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 0.2,
            color: AppThemes.darkTheme.dividerColor,
          ),
          Expanded(
            child: contentoftabbar(),
          ),
        ],
      ),
    );
  }

  Widget tabbutton(int index, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextButton(
        onPressed: () {
          setState(() {
            selectindex = index;
          });
        },
        child: Text(
          label,
          style: GoogleFonts.roboto(
            color: selectindex == index
                ? AppThemes.darkTheme.tabBarTheme.labelColor
                : AppThemes.darkTheme.tabBarTheme.unselectedLabelColor,
            fontWeight:
                selectindex == index ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: selectindex == index
              ? AppThemes.darkTheme.cardColor?.withOpacity(0.1)
              : Colors.transparent,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
    );
  }
}
