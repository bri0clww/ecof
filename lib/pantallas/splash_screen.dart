import 'dart:async';
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
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SizedBox.expand(
        child: Image.asset('assets/ecofy.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover),
              ),
            );
         
  }
}