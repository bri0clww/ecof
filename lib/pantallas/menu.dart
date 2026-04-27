import 'package:ecof/core/colores.dart';
import 'package:ecof/core/rutas.dart';
import 'package:flutter/material.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _header(context),
          _item(context, Icons.home, 'Inicio', AppRoutes.home),
          _item(context, Icons.map, 'Mapa', AppRoutes.mapa),
          _item(context, Icons.recycling, 'Reciclaje', AppRoutes.reciclaje),
          _item(context, Icons.notifications, 'Recordatorios', AppRoutes.recordatorio),
          _item(context, Icons.report, 'Reportes', AppRoutes.reportes),
        ],
      ),
    );
  }

  /// HEADER DEL MENÚ
  Widget _header(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: AppColors.azulOscuro,
      alignment: Alignment.bottomLeft,
      child: Text(
        'Ecofy',
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Colors.white),
      ),
    );
  }

  /// ITEM DEL MENÚ (YA NO ESTÁ MUERTO)
  Widget _item(
    BuildContext context,
    IconData icon,
    String text,
    String route,
  ) {
    return ListTile(
      leading: Icon(icon, color: AppColors.azulOscuro),
      title: Text(text),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, route);
      },
    );
  }
}