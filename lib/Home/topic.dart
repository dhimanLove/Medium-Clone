import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopicItem extends StatelessWidget {
  final String topic;
  final String stories;
  final String followers;
  final VoidCallback? onFollowPressed;

  const TopicItem({
    super.key,
    required this.topic,
    required this.stories,
    required this.followers,
    this.onFollowPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.circle, size: 8, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                topic,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                stories,
                style: GoogleFonts.roboto(
                  color: Colors.grey[400],
                  fontSize: 12,
                ),
              ),
              Text(
                ' • $followers',
                style: GoogleFonts.roboto(
                  color: Colors.grey[400],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: onFollowPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[800],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Follow'),
          ),
        ],
      ),
    );
  }
}