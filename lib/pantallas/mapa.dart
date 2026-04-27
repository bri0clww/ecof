// lib/pantallas/mapa.dart
import 'package:ecof/core/colores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapaScreen extends StatelessWidget {
  const MapaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usamos un Stack para poner elementos sobre el mapa
      body: Stack(
        children: [
          // 1. EL MAPA (Fondo)
          _buildMapPlaceholder(),

          // 2. BOTÓN DE RETORNO (Capa superior izquierda)
          Positioned(
            top: 50,
            left: 20,
            child: _buildBackButton(context),
          ),

          // 3. BARRA DE BÚSQUEDA / ESTADO (Capa superior centro)
          Positioned(
            top: 50,
            left: 80,
            right: 20,
            child: _buildSearchOverlay(),
          ),

          // 4. TARJETA DE INFORMACIÓN DEL CAMIÓN (Capa inferior)
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: _buildTruckStatusCard(),
          ),
        ],
      ),
    );
  }

  // Simulación del mapa (Sustituir por GoogleMap widget)
  Widget _buildMapPlaceholder() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFFE5E3DF), // Color típico de fondo de mapa
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, size: 50, color: AppColors.morado.withOpacity(0.5)),
            const SizedBox(height: 10),
            Text(
              "Cargando mapa en tiempo real...",
              style: GoogleFonts.outfit(color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }

  // Botón de retorno circular y profesional
  Widget _buildBackButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.azulOscuro, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  // Barra de búsqueda rápida sobre el mapa
  Widget _buildSearchOverlay() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey, size: 20),
          const SizedBox(width: 10),
          Text(
            "Buscar puntos de reciclaje...",
            style: GoogleFonts.outfit(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Tarjeta informativa del camión
  Widget _buildTruckStatusCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.verde.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(Icons.local_shipping, color: AppColors.verde),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Camión de Recolección",
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.azulOscuro,
                      ),
                    ),
                    Text(
                      "En ruta hacia tu ubicación",
                      style: GoogleFonts.outfit(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),
              Text(
                "5 min",
                style: GoogleFonts.outfit(
                  color: AppColors.verde,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTruckDetail(Icons.straighten, "350 metros"),
              _buildTruckDetail(Icons.speed, "25 km/h"),
              _buildTruckDetail(Icons.inventory_2, "70% lleno"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTruckDetail(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 5),
        Text(
          label,
          style: GoogleFonts.outfit(fontSize: 12, color: Colors.grey[700]),
        ),
      ],
    );
  }
}