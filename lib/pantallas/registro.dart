import 'package:ecof/core/rutas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nombreCtrl = TextEditingController();
  final TextEditingController correoCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true;

  // ignore: unused_element
  void _crearCuenta() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Simulación de registro
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cuenta creada correctamente")),
      );

      Navigator.pop(context); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Crear cuenta", style: GoogleFonts.outfit()),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [

                const SizedBox(height: 20),

                Text(
                  "Regístrate",
                  style: GoogleFonts.outfit(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Crea tu cuenta para continuar",
                  style: GoogleFonts.outfit(fontSize: 16),
                ),

                const SizedBox(height: 40),

                
                TextFormField(
                  controller: nombreCtrl,
                  decoration: InputDecoration(
                    labelText: "Nombre",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Ingresa tu nombre" : null,
                ),

                const SizedBox(height: 20),

                
                TextFormField(
                  controller: correoCtrl,
                  decoration: InputDecoration(
                    labelText: "Correo electrónico",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return "Ingresa tu correo";
                    if (!value.contains("@")) return "Correo inválido";
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                
                TextFormField(
                  controller: passwordCtrl,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return "Ingresa una contraseña";
                    if (value.length < 6) return "Mínimo 6 caracteres";
                    return null;
                  },
                ),

                const SizedBox(height: 30),

               
                if (_isLoading)
                  const LinearProgressIndicator()
                else
                  const SizedBox(height: 4),

                const SizedBox(height: 30),

                
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.home);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Crear cuenta",
                    style: GoogleFonts.outfit(fontSize: 16),
                  ),
                ),

                const SizedBox(height: 20),

                
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Ya tengo cuenta",
                    style: GoogleFonts.outfit(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}