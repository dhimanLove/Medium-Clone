import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediumm/Home/add.dart';
import 'package:mediumm/Home/for_you.dart';
import 'package:mediumm/theme/Apptheme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1; // Default to "For You" tab

  void switchTab(int index) {
    setState(() {
      if (index == 0) {
        Get.to(const AddScreen());
      } else {
        currentIndex = index;
      }
    });
  }

  Widget buildBody() {
    switch (currentIndex) {
      case 1: // For You

        return ForYou();
      case 2: // Following
        return ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blueAccent.withOpacity(0.1),
                        radius: 20,
                        child: const Icon(Icons.people,
                            size: 24, color: Colors.blueAccent),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Following',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Updates from your network',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey[800],
                      child: const Icon(Icons.person),
                    ),
                    title: Text(
                      'Alex Smith',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    subtitle: Text(
                      'Just posted: "New project update..."',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      case 3: // Featured
        return ListView(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Theme.of(context).cardColor, Colors.black87],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blueAccent.withOpacity(0.1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.trending_up,
                            color: Colors.blueAccent, size: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Top stories trending now',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 24),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'The Rise of AI Writing Tools',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '12.5K views • 2h ago',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      case 4: // Space
        return Container(
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Spaces',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              Text(
                'Live audio conversations',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blueAccent.withOpacity(0.2),
                                Colors.black
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.mic,
                              color: Colors.blueAccent, size: 28),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tech Talk: AI Innovations',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '15 participants • Live now',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Join'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      default:
        return Container(
          height: 200,
          color: Colors.grey[900],
          child: const Center(
            child: Text(
              'No Content Available',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
    }
  }

  Widget tabButton(int index, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextButton(
        onPressed: () => switchTab(index),
        child: Text(
          label,
          style: GoogleFonts.roboto(
            color: currentIndex == index
                ? AppThemes.darkTheme.tabBarTheme.labelColor
                : AppThemes.darkTheme.tabBarTheme.unselectedLabelColor,
            fontWeight:
                currentIndex == index ? FontWeight.w600 : FontWeight.w400,
            fontSize: 13,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: currentIndex == index
              ? AppThemes.darkTheme.cardColor?.withOpacity(0.1)
              : Colors.transparent,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
              ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 18, right: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Home',
                            style: AppThemes.darkTheme.textTheme.displayLarge,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.notifications),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.add, size: 28),
                              onPressed: () => switchTab(0),
                              tooltip: 'Create',
                            ),
                            tabButton(1, 'For You'),
                            tabButton(2, 'Following'),
                            tabButton(3, 'Featured'),
                            tabButton(4, 'Space'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      // Adding minimum height to ensure content is visible
                      height: MediaQuery.of(context).size.height - 150,
                      child: buildBody(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
