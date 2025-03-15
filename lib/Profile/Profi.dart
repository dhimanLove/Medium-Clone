import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: [
            // Stories Tab (Placeholder)
            Container(
              //color: Colors.black,
              child: const Center(
                child: Text('Stories Content', style: TextStyle(color: Colors.white)),
              ),
            ),
            // Lists Tab (Placeholder)
            Container(
              //color: Colors.black,
              child: const Center(
                child: Text('Lists Content', style: TextStyle(color: Colors.white)),
              ),
            ),
            // About Tab Content
            ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Row(
                  children: [
                    const Icon(Icons.lock, color: Colors.grey, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButton<String>(
                        value: 'Public',
                        items: <String>['Public', 'Private'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(color: Colors.white)),
                          );
                        }).toList(),
                        onChanged: (_) {},
                        dropdownColor: Colors.grey[900],
                        underline: const SizedBox(),
                        icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'My Journey in Tech: Learning, Building, and Innovating',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'A Glance about my Journey.',
                  style: TextStyle(color: Colors.grey[400], fontSize: 16),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      '2d ago',
                      style: TextStyle(color: Colors.grey[500], fontSize: 14),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.grey, size: 20),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_horiz, color: Colors.grey, size: 20),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
  }
}