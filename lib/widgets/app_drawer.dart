import 'package:ecof/core/rutas.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget _item(BuildContext context, IconData icon, String text, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(child: Text('Ecofy')),
          ),
          _item(context, Icons.home, 'Inicio', AppRoutes.home),
          _item(context, Icons.map, 'Rutas', AppRoutes.mapa),
          _item(context, Icons.recycling, 'Reciclaje', AppRoutes.reciclaje),
          _item(context, Icons.alarm, 'Recordatorios', AppRoutes.recordatorio),
          _item(context, Icons.report, 'Reportes', AppRoutes.reportes),
        ],
      ),
    );
  }
}