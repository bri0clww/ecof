import 'package:ecof/core/colores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.bigshotOne(
        fontSize: 32,
        color: AppColors.azulOscuro,
      ),
      headlineMedium: GoogleFonts.bigshotOne(
        fontSize: 22,
        color: AppColors.azulOscuro,
      ),
      bodyLarge: GoogleFonts.outfit(fontSize: 16),
      bodyMedium: GoogleFonts.outfit(fontSize: 14),
    ),
  );
}