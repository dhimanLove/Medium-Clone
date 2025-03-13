import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForYou extends StatefulWidget {
  const ForYou({super.key});

  @override
  State<ForYou> createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
  // Sample data structure for posts
  final List<Map<String, dynamic>> posts = [
    {
      'title': "I'm a Professional Editor and These Phrases Tell Me You Used ChatGPT",
      'subtitle': "AI chatbots were trained on novice writing, and it shows",
      'source': "The Writing Cooperative",
      'author': "Loveraj Dhiman Ji",
      'date': "Jan 3",
      'views': "25.8K",
      'comments': "767",
    },
    {
      'title': "The Future of AI in Creative Writing",
      'subtitle': "How technology is shaping storytelling",
      'source': "Tech Writers",
      'author': "Sarah Johnson",
      'date': "Feb 15",
      'views': "18.2K",
      'comments': "543",
    },
    {
      'title': "Mastering Flutter Development",
      'subtitle': "Tips from senior developers",
      'source': "Code Central",
      'author': "Mike Chen",
      'date': "Mar 1",
      'views': "32.1K",
      'comments': "892",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              elevation: 4,
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with source and author
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.article,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "In ${post['source']}",
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: ' by ${post['author']}',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Title
                    const SizedBox(height: 16),
                    Text(
                      post['title'],
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                    ),

                    // Subtitle
                    const SizedBox(height: 8),
                    Text(
                      post['subtitle'],
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                          height: 1.3,
                        ),
                      ),
                    ),

                    // Stats and actions
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        // Date
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                color: Colors.blueAccent,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                post['date'],
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Views
                        const SizedBox(width: 12),
                        Row(
                          children: [
                            Icon(
                              Icons.visibility,
                              color: Colors.grey[500],
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              post['views'],
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        // Comments
                        const SizedBox(width: 12),
                        Row(
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.grey[500],
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              post['comments'],
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        // Actions
                        const Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.bookmark_border,
                            color: Colors.grey[500],
                            size: 20,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.grey[500],
                            size: 20,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}