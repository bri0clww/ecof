import 'package:ecof/core/colores.dart';
import 'package:ecof/core/rutas.dart';
import 'package:ecof/pantallas/mapa.dart';
import 'package:ecof/pantallas/reciclaje.dart';
import 'package:ecof/pantallas/recordatorios.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Lista de pantallas para la navegación
  final List<Widget> _paginas = [
    const DashboardContent(), // AQUÍ ESTÁ TODO TU DISEÑO VISUAL
    const MapaScreen(),
    const ReciclajeScreen(),
    const RecordatoriosScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoClaro,
      body: IndexedStack(
        index: _selectedIndex,
        children: _paginas,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: AppColors.azulMedio.withOpacity(0.3),
              hoverColor: AppColors.azulMedio.withOpacity(0.1),
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: AppColors.azulOscuro,
              color: AppColors.azulOscuro,
              tabs: const [
                GButton(icon: Icons.home_rounded, text: 'Inicio'),
                GButton(icon: Icons.map_rounded, text: 'Mapa'),
                GButton(icon: Icons.eco_rounded, text: 'Reciclar'),
                GButton(icon: Icons.notifications_rounded, text: 'Avisos'),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

// --- ESTE ES EL CONTENIDO QUE SE HABÍA PERDIDO ---
class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 100.0,
          floating: false,
          pinned: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.azulOscuro,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Ecofy', 
              style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: Colors.white)),
            centerTitle: true,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('¡Hola de nuevo!', 
                  style: GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.bold)),
                Text('Cuidemos el planeta hoy.', 
                  style: GoogleFonts.outfit(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 25),
                
                // Tarjeta de Estado (Morada/Azul)
                _buildStatusCard(),
                
                const SizedBox(height: 30),
                Text('Servicios Disponibles',
                  style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.azulOscuro)),
                const SizedBox(height: 15),
                
                // Grid de botones
                _buildGridMenu(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [AppColors.morado, AppColors.azulMedio]),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: AppColors.morado.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 6))],
      ),
      child: Row(
        children: [
          const Icon(Icons.local_shipping, color: Colors.white, size: 35),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Próxima Recolección', style: GoogleFonts.outfit(color: Colors.white70, fontSize: 13)),
              Text('Mañana, 08:30 AM', style: GoogleFonts.outfit(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridMenu(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio: 0.9,
      children: [
        _menuItem(context, 'Mapa', Icons.map_outlined, AppColors.azulMedio, AppRoutes.mapa),
        _menuItem(context, 'Reciclaje', Icons.eco_outlined, AppColors.verde, AppRoutes.reciclaje),
        _menuItem(context, 'Alertas', Icons.notifications_none, AppColors.naranja, AppRoutes.recordatorio),
        _menuItem(context, 'Reportar', Icons.campaign_outlined, AppColors.morado, AppRoutes.reportes),
      ],
    );
  }

  Widget _menuItem(BuildContext context, String title, IconData icon, Color color, String route) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(icon, color: color)),
            const SizedBox(height: 10),
            Text(title, style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: AppColors.azulOscuro)),
          ],
        ),
      ),
    );
  }
}