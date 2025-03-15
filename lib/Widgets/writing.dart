import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediumm/theme/Apptheme.dart';

class WritingScreen extends StatefulWidget {
  const WritingScreen({super.key});

  @override
  State<WritingScreen> createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {
  File? _imageFile;
  final ImagePicker picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _imageFile = File(image.path);
        });
      }
    } catch (e) {
      Get.snackbar('error', 'getting error $e');
      // Optionally handle the error (e.g., show a snackbar to the user)
    }
  }
  late final TextEditingController titlecont;
  late final TextEditingController bodyCont;
  bool _isBold = false;
  bool isitalic = false;

  @override
  void initState() {
    super.initState();
   titlecont = TextEditingController();
    bodyCont = TextEditingController();
  }

  @override
  void dispose() {
   titlecont.dispose();
    bodyCont.dispose();
    super.dispose();
  }

  // Get text style based on formatting states
  TextStyle _getBodyTextStyle() {
    return GoogleFonts.roboto(
      fontSize: 16,
      height: 1.5,
      fontWeight: _isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle:isitalic ? FontStyle.italic : FontStyle.normal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title TextField
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 70.0, 16.0, 0),
                  child: TextField(
                    controller:titlecont,
                    cursorColor: Colors.white70,
                    autocorrect: true,
                    style: GoogleFonts.roboto(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: GoogleFonts.roboto(
                        color: const Color(0xFF757575),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // Body TextField
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                    child: TextField(
                      controller: bodyCont,
                      cursorColor: Colors.white70,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      style: _getBodyTextStyle(),
                      decoration: InputDecoration(
                        hintText: 'Tell your story...',
                        hintStyle: GoogleFonts.roboto(
                          color: const Color(0xFF757575),
                          fontSize: 16,
                          height: 1.5,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
            // Top Left: Close Button
            Positioned(
              top: 8.0,
              left: 0,
              child: IconButton(
                icon: const Icon(Icons.close, size: 24),
                onPressed: () => Get.back(),
              ),
            ),
            // Top Right: Preview and More
            Positioned(
              top: 8.0,
              right: 0,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3C3C3C),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      elevation: 5,
                    ),
                    child: Text(
                      'Preview',
                      style: AppThemes.darkTheme.textTheme.labelLarge?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
            // Bottom: Formatting Toolbar
            Positioned(
              bottom: 16.0,
              left: 0,
              right: 0,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.format_bold,
                        size: 20,
                        color: _isBold ? Colors.blue : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() => _isBold = !_isBold);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.format_italic,
                        size: 20,
                        color:isitalic ? Colors.blue : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() =>isitalic = ! isitalic);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.format_list_numbered, size: 20),
                      onPressed: () {
                        // Add numbered list functionality
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.format_quote, size: 20),
                      onPressed: () {
                        // Add quote functionality
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.format_list_bulleted, size: 20),
                      onPressed: () {
                        // Add bulleted list functionality
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.link, size: 20),
                      onPressed: () {
                        // Add link functionality
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.image, size: 20),
                      onPressed: () {
                        _pickImage();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}