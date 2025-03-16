import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mediumm/theme/Apptheme.dart';

class HistoryScreen extends StatelessWidget {
  final List<Map<String, String>> articles = [
    {
      'source': 'Flutter News Hub',
      'title': 'Flutter Quill: A Rich Text Editor for Flutter',
      'date': 'Jul 13, 2024',
      'comments': '6'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Card(
               color: AppThemes.darkTheme.cardColor,
               elevation: 3,
               //margin: EdgeInsets.all(value),
               child:  Padding(
                 padding: const EdgeInsets.all(10),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       'You can clear your reading history for a fresh start.',
                       style: TextStyle(color: Colors.grey[400]),
                     ),
                     Padding(
                       padding: const EdgeInsets.symmetric(
                         vertical: 10,
                         horizontal: 0
                       ),
                       child: ElevatedButton(
                         onPressed: () {
                           historydialog(context);
                         },
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.red[300],
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(20),
                           ),
                         ),
                         child: Text('Clear history', style: TextStyle(color: Colors.white)),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return Card(
                      elevation: 0,
                      color: Theme.of(context).cardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.grey[700],
                                  child: Icon(Icons.article, size: 16, color: Colors.white),
                                ),
                                SizedBox(width: 8),
                                Text(article['source']!, style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(article['title']!, style: TextStyle(fontSize: 16)),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(article['date']!, style: TextStyle(fontSize: 12)),
                                    SizedBox(width: 16),
                                    Icon(Icons.comment, size: 16, color: Colors.grey[400]),
                                    SizedBox(width: 4),
                                    Text(article['comments']!, style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                                Icon(Icons.share, size: 20, color: Colors.grey[400]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void historydialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text('Clear History'),
        content: Text('Are you sure you want to clear your reading history?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Cancel')),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar('Success', 'Reading history cleared!', backgroundColor: Colors.green);
            },
            child: Text('Clear', style: TextStyle(color: Colors.red[300])),
          ),
        ],
      ),
    );
  }
}
