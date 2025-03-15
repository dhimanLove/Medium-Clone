import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _blogController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _blogController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: Text(
          'Add Screen',
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.blueAccent,
            indicatorWeight: 4,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[600],
            labelStyle: GoogleFonts.roboto(
              textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            unselectedLabelStyle: GoogleFonts.roboto(
              textStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 0),
            tabs: [
              Tab(
                icon: IconButton(
                  onPressed: () {
                    _tabController.animateTo(0); // Stay on the Add tab
                  },
                  icon: const Icon(Icons.add, size: 28, color: Colors.white),
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
          // Add Tab: Blog Writing Area
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:Container(),
          ),
          // For You Tab
          Container(color: Colors.black, child: const Center(child: Text('For You', style: TextStyle(color: Colors.white)))),
          // Following Tab
          Container(color: Colors.black, child: const Center(child: Text('Following', style: TextStyle(color: Colors.white)))),
          // Featured Tab
          Container(color: Colors.black, child: const Center(child: Text('Featured', style: TextStyle(color: Colors.white)))),
          // Space Tab
          Container(color: Colors.black, child: const Center(child: Text('Space', style: TextStyle(color: Colors.white)))),
        ],
      ),
    );
  }
}