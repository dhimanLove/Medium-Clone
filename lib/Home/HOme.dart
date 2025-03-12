import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Home',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.light_mode,
                    color: Color(0xB3FFFFFF),
                  ),
                  onPressed: () {
                    Get.changeTheme(ThemeData.light());
                  },
                  tooltip: 'Switch to Light Mode',
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(
                    Icons.dark_mode,
                    color: Color(0xB3FFFFFF),
                  ),
                  onPressed: () {
                    Get.changeTheme(ThemeData.dark());
                  },
                  tooltip: 'Switch to Dark Mode',
                ),
              ],
            ),
          )
        ],
        bottom: TabBar(
          dividerColor: Colors.white12,
          controller: _tabController,
          indicatorColor: Colors.white70,
          labelPadding: const EdgeInsets.symmetric(horizontal: 10),
          labelStyle: TextStyle(color: Color(0xB3FFFFFF)),
          unselectedLabelStyle: TextStyle(color: Color(0xB3FFFFFF)),
          tabs: const [
            Tab(
              icon: Icon(
                Icons.add,
                color: Color(0xB3FFFFFF),
              ),
            ),
            Tab(
              text: 'For you',
            ),
            Tab(
              text: 'Following',
            ),
            Tab(
              text: 'Featured',
            ),
            Tab(
              text: 'Space',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
          4,
              (index) => ListView(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            children: [
              Card(
                elevation: 5,
                margin: const EdgeInsets.only(bottom: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  color: Colors.black87,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.description,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "In The Writing Cooperative",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' by Loveraj Dhiman Ji',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "I'm a Professional\nEditor and These\nPhrases Tell Me You\nUsed ChatGPT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "AI chatbots were trained on\nnovice writing, and it shows",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "Jan 3",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Row(
                            children: const [
                              Icon(
                                Icons.visibility,
                                color: Colors.grey,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "25.8K",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Row(
                            children: const [
                              Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.grey,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "767",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.bookmark_border,
                            color: Colors.grey,
                            size: 20,
                          ),
                          const SizedBox(width: 16),
                          const Icon(
                            Icons.more_vert,
                            color: Colors.grey,
                            size: 17,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5,
                margin: const EdgeInsets.only(bottom: 16),
                child: Container(
                  width: double.infinity,
                  color: Colors.black87,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.description,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "In The Writing Cooperative",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' by Loveraj Dhiman Ji',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "I'm a Professional\nEditor and These\nPhrases Tell Me You\nUsed ChatGPT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "AI chatbots were trained on\nnovice writing, and it shows",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "Jan 3",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Row(
                            children: const [
                              Icon(
                                Icons.visibility,
                                color: Colors.grey,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "25.8K",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Row(
                            children: const [
                              Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.grey,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "767",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.bookmark_border,
                            color: Colors.grey,
                            size: 20,
                          ),
                          const SizedBox(width: 16),
                          const Icon(
                            Icons.more_vert,
                            color: Colors.grey,
                            size: 17,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5,
                margin: const EdgeInsets.only(bottom: 16),
                child: Container(
                  width: double.infinity,
                  color: Colors.black87,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.description,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "In The Writing Cooperative",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' by Loveraj Dhiman Ji',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "I'm a Professional\nEditor and These\nPhrases Tell Me You\nUsed ChatGPT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "AI chatbots were trained on\nnovice writing, and it shows",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "Jan 3",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Row(
                            children: const [
                              Icon(
                                Icons.visibility,
                                color: Colors.grey,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "25.8K",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Row(
                            children: const [
                              Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.grey,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "767",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.bookmark_border,
                            color: Colors.grey,
                            size: 20,
                          ),
                          const SizedBox(width: 16),
                          const Icon(
                            Icons.more_vert,
                            color: Colors.grey,
                            size: 17,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5,
                margin: const EdgeInsets.only(bottom: 20),
                child: Container(
                  width: double.infinity,
                  color: Colors.black87,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.description,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "In The Writing Cooperative",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' by Loveraj Dhiman Ji',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "I'm a Professional\nEditor and These\nPhrases Tell Me You\nUsed ChatGPT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "AI chatbots were trained on\nnovice writing, and it shows",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "Jan 3",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Row(
                            children: const [
                              Icon(
                                Icons.visibility,
                                color: Colors.grey,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "25.8K",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Row(
                            children: const [
                              Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.grey,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "767",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.bookmark_border,
                            color: Colors.grey,
                            size: 20,
                          ),
                          const SizedBox(width: 16),
                          const Icon(
                            Icons.more_vert,
                            color: Colors.grey,
                            size: 17,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
