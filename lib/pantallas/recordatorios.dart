import 'package:ecof/core/colores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecordatoriosScreen extends StatefulWidget {
  const RecordatoriosScreen({super.key});

  @override
  State<RecordatoriosScreen> createState() => _RecordatoriosScreenState();
}

class _RecordatoriosScreenState extends State<RecordatoriosScreen> {
  bool _notifGeneral = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fondoClaro,
      appBar: AppBar(
        title: Text("Mis Avisos", style: GoogleFonts.outfit(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCalendarHeader(),
            const SizedBox(height: 30),
            _buildToggleOption("Notificaciones Push", _notifGeneral, (val) => setState(() => _notifGeneral = val)),
            const Divider(height: 40),
            Text("Horarios de esta semana", style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            _buildReminderTile("Mañana", "Orgánicos y Plásticos", "08:30 AM", AppColors.naranja),
            _buildReminderTile("Jueves", "Papel y Vidrio", "09:00 AM", AppColors.azulMedio),
            _buildReminderTile("Sábado", "Recolección General", "10:00 AM", AppColors.verde),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarHeader() {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          bool isToday = index == 1; // Simulación
          return Container(
            width: 60,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: isToday ? AppColors.azulOscuro : Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Día", style: TextStyle(color: isToday ? Colors.white70 : Colors.grey, fontSize: 12)),
                Text("${index + 20}", style: GoogleFonts.outfit(color: isToday ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildToggleOption(String title, bool val, Function(bool) onChanged) {
    return SwitchListTile(
      value: val,
      onChanged: onChanged,
      title: Text(title, style: GoogleFonts.outfit(fontWeight: FontWeight.w600)),
      secondary: Icon(Icons.notifications_active, color: AppColors.morado),
      activeColor: AppColors.morado,
    );
  }

  Widget _buildReminderTile(String day, String type, String hour, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border(left: BorderSide(color: color, width: 6)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(day, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
              Text(type, style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          Text(hour, style: GoogleFonts.outfit(color: AppColors.azulOscuro, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}