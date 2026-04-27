import 'package:ecof/core/colores.dart';
import 'package:ecof/core/rutas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const EcofyApp());
}

class EcofyApp extends StatelessWidget {
  const EcofyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecofy',
      // Asegúrate de que en AppRoutes.splash tengas la lógica para ir a Login
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.generate,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.azulOscuro,
          primary: AppColors.azulOscuro,
          secondary: AppColors.morado,
          surface: AppColors.fondoClaro,
        ),
        scaffoldBackgroundColor: AppColors.fondoClaro,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0, // Evita cambios de color al hacer scroll
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.azulOscuro),
        ),
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.outfit(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.azulOscuro,
          ),
          headlineMedium: GoogleFonts.outfit(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.azulOscuro,
          ),
          bodyLarge: GoogleFonts.outfit(
            fontSize: 16,
            color: Colors.black87,
          ),
          bodyMedium: GoogleFonts.outfit(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}