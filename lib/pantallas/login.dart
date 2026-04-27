// lib/pantallas/login.dart
import 'package:ecof/core/colores.dart';
import 'package:ecof/core/rutas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;

  void _handleLogin() {
    setState(() => _isLoading = true);
    // Simulación de carga
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animación de entrada para el logo
              TweenAnimationBuilder(
                duration: const Duration(seconds: 1),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, double value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: Image.asset('assets/logo.png', width: 120), // Tu logo
              ),
              const SizedBox(height: 20),
              Text('Iniciar sesión', style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w500)),
              const SizedBox(height: 10),
              Text('Usa tu cuenta de Ecofy', style: GoogleFonts.outfit(fontSize: 16)),
              const SizedBox(height: 40),
              
              // Campos de texto estilo Google
              TextField(
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.azulMedio, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              if (_isLoading)
                const LinearProgressIndicator(color: AppColors.azulMedio)
              else
                const SizedBox(height: 4),

              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('Crear cuenta', style: GoogleFonts.outfit(color: AppColors.azulMedio, fontWeight: FontWeight.bold)),
                  ),
                  ElevatedButton(
                    onPressed: _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.azulMedio,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Siguiente'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}