class ReporteModelo {
  final String tipo;
  final String descripcion;
  final DateTime fecha;

  ReporteModelo({
    required this.tipo,
    required this.descripcion,
    required this.fecha,
  });

  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'descripcion': descripcion,
      'fecha': fecha.toIso8601String(),
    };
  }
}