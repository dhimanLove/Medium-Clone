import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediumm/theme/Apptheme.dart';

class ForYou extends StatefulWidget {
  const ForYou({super.key});

  @override
  State<ForYou> createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
  final List posts = [
    {
      'title':
          "I'm a Professional Editor and These Phrases Tell Me You Used ChatGPT",
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
      'title': "Exploring the Ethics of AI-Generated Art",
      'subtitle': "A deep dive into the moral implications",
      'source': "Art & AI Journal",
      'author': "Emma Rodriguez",
      'date': "Dec 20",
      'views': "14.7K",
      'comments': "321",
    },
    {
      'title': "Building Scalable Apps with Flutter",
      'subtitle': "Best practices for large-scale development",
      'source': "Dev Insights",
      'author': "Alex Carter",
      'date': "Jan 12",
      'views': "29.3K",
      'comments': "678",
    },
    {
      'title': "The Rise of Virtual Reality in Education",
      'subtitle': "Transforming learning with immersive tech",
      'source': "EduTech Review",
      'author': "Priya Sharma",
      'date': "Feb 28",
      'views': "22.5K",
      'comments': "489",
    },
    {
      'title': "Mastering Machine Learning Algorithms",
      'subtitle': "A beginner's guide to advanced techniques",
      'source': "AI Academy",
      'author': "John Lee",
      'date': "Mar 5",
      'views': "36.9K",
      'comments': "912",
    },
    {
      'title': "The Impact of Blockchain on Finance",
      'subtitle': "Revolutionizing transactions and security",
      'source': "Finance Innovate",
      'author': "Michael Brown",
      'date': "Jan 18",
      'views': "19.4K",
      'comments': "345",
    },
    {
      'title': "Designing User-Friendly Mobile Interfaces",
      'subtitle': "Key principles for modern app design",
      'source': "UX Magazine",
      'author': "Lisa Kim",
      'date': "Feb 10",
      'views': "15.6K",
      'comments': "234",
    },
    {
      'title': "The Evolution of Cloud Computing",
      'subtitle': "Trends shaping the future of storage",
      'source': "Cloud Tech Weekly",
      'author': "David Patel",
      'date': "Mar 8",
      'views': "27.1K",
      'comments': "567",
    },
    {
      'title': "Cybersecurity in the Age of AI",
      'subtitle': "Protecting data with intelligent systems",
      'source': "Security Digest",
      'author': "Rachel Nguyen",
      'date': "Feb 22",
      'views': "33.8K",
      'comments': "789",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    child:
        RefreshIndicator(
          onRefresh: () async {
            Get.snackbar(
              'Hello',
              'Refreshed',
              dismissDirection: DismissDirection.horizontal,
              isDismissible: true,
            );
            return Future.delayed(const Duration(seconds: 1));
          },
          child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              color: AppThemes.darkTheme.cardColor,
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
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
    ),
    );
  }
}
