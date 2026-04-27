import 'dart:async';
import 'package:ecof/core/colores.dart';
import 'package:ecof/core/rutas.dart';
import 'package:flutter/material.dart';


// lib/pantallas/splash.dart
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.azulOscuro,
      body: Center(
        child: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 1500),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, double value, child) {
            return Opacity(
              opacity: value,
              child: Transform.scale(
                scale: value,
                child: Image.asset('assets/logo.png', width: 200),
              ),
            );
          },
        ),
      ),
    );
  }
}