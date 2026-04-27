// lib/pantallas/reportes.dart
import 'package:ecof/core/colores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportesScreen extends StatelessWidget {
  const ReportesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoClaro,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.azulOscuro),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Reportar Incidencia', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: AppColors.azulOscuro)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoBox(),
            const SizedBox(height: 25),
            _label("Tipo de reporte"),
            _buildDropdown(),
            const SizedBox(height: 20),
            _label("Descripción"),
            _buildTextField("Describe el problema (ej. el camión no pasó)...", maxLines: 5),
            const SizedBox(height: 20),
            _buildPhotoPicker(),
            const SizedBox(height: 40),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(text, style: GoogleFonts.outfit(fontWeight: FontWeight.bold, color: AppColors.azulOscuro)),
  );

  Widget _buildInfoBox() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: AppColors.naranja.withOpacity(0.1), borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Icon(Icons.lightbulb, color: AppColors.naranja),
          const SizedBox(width: 10),
          const Expanded(child: Text("Tus reportes nos ayudan a mejorar el servicio de recolección en tu zona.")),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildPhotoPicker() {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[400]!, strokeAlign: BorderSide.strokeAlignInside),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.camera_alt_outlined, color: Colors.grey), Text("Adjuntar evidencia (foto)", style: TextStyle(color: Colors.grey))],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.azulOscuro,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: () {},
        child: const Text("Enviar Reporte", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: "Camión no pasó",
          items: ["Camión no pasó", "Personal descortés", "Contenedor dañado", "Otro"]
              .map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (v) {},
        ),
      ),
    );
  }
}