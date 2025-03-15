import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediumm/Home/add.dart';
import 'package:mediumm/Home/for_you.dart';
import 'package:mediumm/Widgets/writing.dart';
import 'package:mediumm/theme/Apptheme.dart';
import 'package:mediumm/theme/Themecontroller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ThemeController themeController =
      Get.find<ThemeController>(); // Get the controller

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Home',
          style: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.light_mode),
                  onPressed: () => themeController.switchToLightTheme(),
                  tooltip: 'Switch to Light Mode',
                ),
                IconButton(
                  icon: const Icon(Icons.dark_mode),
                  onPressed: () => themeController.switchToDarkTheme(),
                  tooltip: 'Switch to Dark Mode',
                ),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.blueAccent,
            indicatorWeight: 4,
            labelColor: Theme.of(context).tabBarTheme.labelColor,
            unselectedLabelColor:
                Theme.of(context).tabBarTheme.unselectedLabelColor,
            labelStyle: GoogleFonts.roboto(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
            unselectedLabelStyle: GoogleFonts.roboto(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 0),
            tabs: [
              Tab(
                icon: IconButton(
                  onPressed: () {
                    Get.to(const AddScreen());
                  },
                  icon: const Icon(Icons.add, size: 28),
                ),
              ),
              const Tab(text: 'For You'),
              const Tab(text: 'Following'),
              const Tab(text: 'Featured'),
              const Tab(text: 'Space'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Something New',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 12),
                Text(
                  'Start writing or uploading content',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Add your submit logic here
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: Text(
                    'Post',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
          const ForYou(),
          ListView(
            padding: const EdgeInsets.all(16),
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
                          style: Theme.of(context).textTheme.displayLarge,
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
          ),
          ListView(
            padding: const EdgeInsets.all(16),
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
                          style: Theme.of(context).textTheme.displayLarge,
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
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Spaces',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 12),
                Text(
                  'Live audio conversations',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
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
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '15 participants • Live now',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style:
                                  Theme.of(context).elevatedButtonTheme.style,
                              child: Text(
                                'Join',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
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
      ),
    );
  }
}
