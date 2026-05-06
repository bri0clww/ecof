import 'package:ecof/pantallas/home.dart';
import 'package:ecof/pantallas/login.dart';
import 'package:ecof/pantallas/mapa.dart';
import 'package:ecof/pantallas/perfil.dart';
import 'package:ecof/pantallas/reciclaje.dart';
import 'package:ecof/pantallas/recordatorios.dart';
import 'package:ecof/pantallas/reportes.dart';
import 'package:ecof/pantallas/splash_screen.dart';
import 'package:ecof/pantallas/registro.dart'; 
import 'package:flutter/material.dart';


class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const home = '/home';
  static const mapa = '/mapa';
  static const reciclaje = '/reciclaje';
  static const recordatorio = '/recordatorio';
  static const reportes = '/reportes';
  static const registro = '/registro';
  static const perfil = '/perfil';

  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _route(SplashScreen());
      case login:
        return _route(const LoginScreen());
      case home:
        return _route(const HomeScreen());
      case mapa:
        return _route(const MapaScreen());
      case reciclaje:
        return _route(const ReciclajeScreen());
      case recordatorio:
        return _route(const RecordatoriosScreen());
      case reportes:
        return _route(const ReportesScreen());

      case registro: 
        return _route(const RegistroScreen());
      case perfil:
        return _route(const PerfilScreen());

      default:
        return _route(SplashScreen());
    }
  }

  static PageRouteBuilder _route(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        final slide = Tween<Offset>(
          begin: const Offset(0.1, 0),
          end: Offset.zero,
        ).animate(animation);

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: slide, child: child),
        );
      },
    );
  }
}