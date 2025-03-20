import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.grey[100],
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Color(0xFF1A1A1A),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF1A1A1A)),
    ),
    cardTheme: const CardTheme(
      color: Color(0xFF1A1A1A),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.roboto(
        color: const Color(0xFF1A1A1A),
        fontSize: 26,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: GoogleFonts.roboto(
        color: const Color(0xFF1A1A1A),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: GoogleFonts.roboto(
        color: const Color(0xFF1A1A1A),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.roboto(
        color: const Color(0xFF1A1A1A),
        fontSize: 12,
        fontWeight: FontWeight.w300,
      ),
      labelLarge: GoogleFonts.roboto(
        color: const Color(0xFF1A1A1A),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: Colors.white70,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: const Color(0xFF1A1A1A),
      unselectedLabelColor: Colors.grey[600],
      labelStyle: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w600),
      unselectedLabelStyle:
      GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w400),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3C3C3C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 0),
        elevation: 5,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
      hintStyle: GoogleFonts.roboto(color: Colors.grey[600]),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF1A1A1A),
      unselectedItemColor: Colors.grey[600],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all(Colors.grey[300]),
      thumbColor: MaterialStateProperty.all(Colors.blue),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xFF1A1A1A),
    cardColor: Colors.grey[900],
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1A1A1A),
      foregroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white70),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 26,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: GoogleFonts.roboto(
        color: Colors.grey[400],
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.roboto(
        color: Colors.grey[400],
        fontSize: 12,
        fontWeight: FontWeight.w300,
      ),
      labelLarge: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: Colors.blueAccent,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey[600],
      labelStyle: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w600),
      unselectedLabelStyle:
      GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w400),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3C3C3C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 0),
        elevation: 5,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[900],
      hintStyle: GoogleFonts.roboto(color: Colors.grey[600]),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color(0xFF3F3F3F),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey[600],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStatePropertyAll(Colors.grey[700]),
      thumbColor: WidgetStateProperty.all(Colors.blueAccent),
    ),
  );
}
