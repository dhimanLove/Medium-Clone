import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediumm/Home/Home.dart';
import 'package:mediumm/Profile/Profile.dart';
import 'package:mediumm/Saved/Saved.dart';
import 'package:mediumm/Search/Search.dart';
import 'package:mediumm/Widgets/writing.dart';
import 'package:mediumm/theme/Apptheme.dart';

class GoogleNav extends StatefulWidget {
  const GoogleNav({super.key});

  @override
  State<GoogleNav> createState() => GoogleNavState();
}

class GoogleNavState extends State<GoogleNav> {
  int selectedIndex = 0;
  final List<Widget> pages = const [
    HomeScreen(),
    Search(),
    Saved(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: ''),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(
                'https://cdn2.iconfinder.com/data/icons/male-avatars/256/avatars_accounts___man_male_people_person_wavy_hair_jacket_turtleneck.png',
              ),
            ),
            label: '',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.green,
        onPressed: () {
          Get.to(const WritingScreen());
        },
        child: const Icon(Icons.edit_note_sharp, size: 30),
      ),
    );
  }
}
