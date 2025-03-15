import 'package:flutter/material.dart';

class Saved extends StatelessWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey[700],
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Love Raj Dhiman',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Jan 10 · 1 Story 🔒',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 24.0),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.grey[600],
                        size: 24,
                      ),
                      SizedBox(width: 6),
                      Text(
                        '--',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 32),
                      Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.grey[600],
                        size: 24,
                      ),
                      SizedBox(width: 6),
                      Text(
                        '--',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
