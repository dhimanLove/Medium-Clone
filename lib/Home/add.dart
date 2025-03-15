import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediumm/theme/Apptheme.dart';
//import 'package:mediumm/theme/Theme-controller.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  //final TextEditingController _blogController = TextEditingController();
  int selectindex = 0;

  @override
  void initState() {
    super.initState();
  }

  Widget contentoftabbar() {
    switch (selectindex) {
      case 0:
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 60,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: AppThemes.darkTheme.elevatedButtonTheme.style,
                child: Text(
                  'Submit',
                  style: AppThemes.darkTheme.textTheme.labelLarge,
                ),
              ),
            ],
          ),
        );

      case 1:
        return Center(
          child: Text(
            'For You Content',
            style: AppThemes.darkTheme.textTheme.bodyLarge,
          ),
        );

      case 2:
        return Center(
          child: Text(
            'Following Content',
            style: AppThemes.darkTheme.textTheme.bodyLarge,
          ),
        );

      case 3:
        return Center(
          child: Text(
            'Featured Content',
            style: AppThemes.darkTheme.textTheme.bodyLarge,
          ),
        );

      case 4:
        return Center(
          child: Text(
            'Space Content',
            style: AppThemes.darkTheme.textTheme.bodyLarge,
          ),
        );

      default:
        return Center(
          child: Text(
            'Select an option',
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
        leading:IconButton(onPressed:(){
          Get.back();
        }, icon:  Icon(
          Icons.arrow_back,
          color: AppThemes.darkTheme.appBarTheme.iconTheme?.color,
        ),),
        title: Text(
          'Add Screen',
          style: AppThemes.darkTheme.textTheme.displayLarge?.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0), // Reduced vertical padding
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tabbutton(0, 'Add'),
                  tabbutton(1, 'For You'),
                  tabbutton(2, 'Following'),
                  tabbutton(3, 'Featured'),
                  tabbutton(4, 'Space'),
                ],
              ),
            ),
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
            fontWeight: selectindex == index ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: selectindex == index
              ? AppThemes.darkTheme.cardColor?.withOpacity(0.1)
              : Colors.transparent,
          elevation: 0, // Removed elevation for a flatter look
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Reduced padding
        ),
      ),
    );
  }
}