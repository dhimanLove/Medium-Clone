import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mediumm/Home/preview.dart';
import 'package:mediumm/theme/Apptheme.dart';
import 'package:flutter_quill/quill_delta.dart' as quill;
import 'package:flutter_quill/flutter_quill.dart';

class WritingScreen extends StatefulWidget {
  const WritingScreen({super.key});

  @override
  State<WritingScreen> createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {
  final controller = QuillController.basic();
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
      fontStyle: isitalic ? FontStyle.italic : FontStyle.normal,
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
                    controller: titlecont,
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
                    child: QuillEditor.basic(
                      controller: controller,
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
                      Get.to(MediumPreviewScreen());
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
              child: QuillToolbar.simple(
                controller: controller,
                configurations: QuillSimpleToolbarConfigurations(

                  showBoldButton: true,
                  //toolbarSize: ,
                  showItalicButton: true,
                  showStrikeThrough: true,
                  //showClearFormat: true,
                  showListNumbers: true,
                  showListBullets: true,
                  showQuote: true,
                  showLink: true,
                 // showDividers: true,

                  showColorButton: false,
                  showBackgroundColorButton: false,
                  showAlignmentButtons: false,
                  showLeftAlignment: false,
                  showCenterAlignment: false,
                  showRightAlignment: false,
                  showJustifyAlignment: false,
                  showHeaderStyle: false,
                  showListCheck: false,
                  showCodeBlock: false,
                  showIndent: false,
                  showUndo: false,
                  showRedo: false,
                  showFontSize: false,
                  showFontFamily: false,
                  showSearchButton: false,
                  showSubscript: false,
                  showSuperscript: false,
                  multiRowsDisplay: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}