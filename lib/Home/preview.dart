import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MediumPreviewScreen extends StatefulWidget {
  @override
  _MediumPreviewScreenState createState() => _MediumPreviewScreenState();
}

class _MediumPreviewScreenState extends State<MediumPreviewScreen> {
  bool _isUnlisted = false; // State for the toggle switch

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(''),

          elevation: 0, // Remove shadow
        ),
        // Dark background
        body: SingleChildScrollView(child: Center(child: Text("Loveraj "),)));
  }
}
