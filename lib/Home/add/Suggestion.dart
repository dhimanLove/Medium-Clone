import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediumm/theme/Apptheme.dart';

class Suggestion extends StatefulWidget {
  const Suggestion({super.key});

  @override
  State<Suggestion> createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  String? selectedValue = 'Topics';
  final List topics = [
    {
      'name': 'Writing',
      'stories': '972K stories',
      'followers': '8M followers',
      'imageUrl': 'https://picsum.photos/seed/writing/100',
      'isFollowing': false
    },
    {
      'name': 'Relationships',
      'stories': '621K stories',
      'followers': '7M followers',
      'imageUrl': 'https://picsum.photos/seed/relationships/100',
      'isFollowing': false
    },
    {
      'name': 'Productivity',
      'stories': '414K stories',
      'followers': '6M followers',
      'imageUrl': 'https://picsum.photos/seed/productivity/100',
      'isFollowing': false
    },
    {
      'name': 'Politics',
      'stories': '602K stories',
      'followers': '4M followers',
      'imageUrl': 'https://picsum.photos/seed/politics/100',
      'isFollowing': false
    },
    {
      'name': 'Psychology',
      'stories': '413K stories',
      'followers': '7M followers',
      'imageUrl': 'https://picsum.photos/seed/psychology/100',
      'isFollowing': false
    },
    {
      'name': 'Money',
      'stories': '823K stories',
      'followers': '8M followers',
      'imageUrl': 'https://picsum.photos/seed/money/100',
      'isFollowing': false
    },
    {
      'name': 'Business',
      'stories': '853K stories',
      'followers': '7M followers',
      'imageUrl': 'https://picsum.photos/seed/business/100',
      'isFollowing': false
    },
  ];

  void _toggleFollow(int index) {
    setState(() {
      topics[index]['isFollowing'] = !topics[index]['isFollowing'];
    });
    final topicName = topics[index]['name'];
    final message = topics[index]['isFollowing']
        ? 'Followed $topicName'
        : 'Unfollowed $topicName';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppThemes.darkTheme.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            'Select Category',
            style: AppThemes.darkTheme.textTheme.headlineSmall?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Dialogoptions('All'),
                Dialogoptions('Topics'),
                Dialogoptions('Writers'),
                Dialogoptions('Publications'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey[400]),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget Dialogoptions(String value) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedValue = value;
        });
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: selectedValue,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue;
                });
                Navigator.pop(context);
              },
              activeColor: Colors.green[700],
            ),
            Text(
              value,
              style: AppThemes.darkTheme.textTheme.bodyLarge?.copyWith(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: GestureDetector(
                    onTap: _showSelectionDialog,
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: AppThemes.darkTheme.cardColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              selectedValue ?? "Topics",
                              style: AppThemes.darkTheme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: topics.length,
                  itemBuilder: (context, index) {
                    final topic = topics[index];
                    return Card(
                      color: AppThemes.darkTheme.cardColor,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 12.0,
                        ),
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(topic['imageUrl']),
                          onBackgroundImageError: (exception, stackTrace) {
                            print('Error loading image: $exception');
                          },
                          child: topic['imageUrl'] == null
                              ? Icon(Icons.image_not_supported, size: 24)
                              : null,
                        ),
                        title: Text(
                          topic['name'],
                          style: AppThemes.darkTheme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            '${topic['stories']} • ${topic['followers']}',
                            style: AppThemes.darkTheme.textTheme.bodySmall?.copyWith(
                              color: Colors.grey[400],
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        trailing: ElevatedButton(
                          onPressed: () => _toggleFollow(index),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: topic['isFollowing']
                                ? Colors.green[700]
                                : AppThemes.darkTheme.elevatedButtonTheme.style?.backgroundColor?.resolve({}) ?? Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                          ),
                          child: Text(
                            topic['isFollowing'] ? 'Following' : 'Follow',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),

                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
