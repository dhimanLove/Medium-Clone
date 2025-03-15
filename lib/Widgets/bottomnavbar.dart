import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mediumm/Home/Home.dart';
import 'package:mediumm/Profile/Profi.dart';
import 'package:mediumm/Saved/Saved.dart';
import 'package:mediumm/Search/Search.dart';
import 'package:mediumm/Widgets/writing.dart';

class GoogleNav extends StatefulWidget {
  const GoogleNav({super.key});

  @override
  State<GoogleNav> createState() => _GoogleNavState();
}

class _GoogleNavState extends State<GoogleNav> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  static const List<Widget> _pages = [
    HomeScreen(),
    Search(),
    Saved(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[900],
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          //color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: GNav(
              selectedIndex: _selectedIndex,
              onTabChange: _onTabChange,
              //activeColor: Colors.grey[300],
              haptic: true,
              //rippleColor: Colors.grey[400]!,
             // hoverColor: Colors.grey[700]!,
              gap: 8,
              iconSize: 30,
              //color: Colors.grey[500],
             // tabBackgroundColor: Colors.grey[800]!,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              tabs: [
                GButton(
                  icon: Icons.home,
                ),
                GButton(
                  icon: Icons.search,
                ),
                GButton(
                  icon: Icons.bookmark_add_outlined,
                ),
                GButton(
                  icon: Icons.circle,
                  iconColor: Colors.transparent,
                  leading: CircleAvatar(
                    //backgroundColor: Colors.grey[600],
                    backgroundImage: NetworkImage(
                        'https://cdn2.iconfinder.com/data/icons/male-avatars/256/avatars_accounts___man_male_people_person_wavy_hair_jacket_turtleneck.png'),
                    radius: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.green,
        onPressed: () {
          Get.to(WritingScreen());
        },
        child:Icon(Icons.edit_note_sharp,size: 30,),
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTabChange(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _selectedIndex = index;
    });
  }
}
