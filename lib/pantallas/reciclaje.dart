import 'package:ecof/core/colores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReciclajeScreen extends StatelessWidget {
  const ReciclajeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoClaro,
      body: Column(
        children: [
          _buildCustomHeader(context),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                _sectionTitle("Guía por Materiales"),
                _detailedCard(
                  context,
                  "Plásticos y Envases",
                  "Contenedor Amarillo",
                  AppColors.naranja,
                  "SÍ: Botellas, latas, briks, bolsas, tapas.\nNO: Juguetes, cubiertos de plástico, CD's.",
                  Icons.recycling_rounded,
                ),
                _detailedCard(
                  context,
                  "Papel y Cartón",
                  "Contenedor Azul",
                  AppColors.azulMedio,
                  "SÍ: Cajas de cartón, revistas, folletos.\nNO: Servilletas sucias, cartón con grasa.",
                  Icons.auto_stories_rounded,
                ),
                _detailedCard(
                  context,
                  "Vidrio",
                  "Contenedor Verde",
                  AppColors.verde,
                  "SÍ: Botellas de vidrio, frascos de perfume.\nNO: Espejos, cerámica, bombillas.",
                  Icons.wine_bar_rounded,
                ),
                _detailedCard(
                  context,
                  "Orgánicos",
                  "Contenedor Marrón",
                  AppColors.beige,
                  "SÍ: Cáscaras de fruta, restos de café.\nNO: Pañales, excremento de mascota.",
                  Icons.eco_rounded,
                ),
                const SizedBox(height: 20),
                _buildSpecialSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
      decoration: const BoxDecoration(
        color: AppColors.azulOscuro,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              Text('Enciclopedia Eco', style: GoogleFonts.outfit(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              hintText: "¿Qué quieres reciclar hoy?",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailedCard(BuildContext context, String title, String container, Color color, String info, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: ExpansionTile(
        leading: CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(icon, color: color)),
        title: Text(title, style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        subtitle: Text(container, style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 12)),
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(info, style: GoogleFonts.outfit(color: Colors.grey[700], height: 1.5)),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.morado.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.morado.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Row(children: [
            Icon(Icons.warning_amber_rounded, color: AppColors.morado),
            const SizedBox(width: 10),
            Text("Puntos Limpios", style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: AppColors.morado)),
          ]),
          const SizedBox(height: 10),
          const Text("Pilas, aceite usado, medicinas y electrónicos NO van en los contenedores normales. Busca el punto más cercano en el mapa."),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Text(text, style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.azulOscuro)),
  );
}