import 'package:anime_guide/pages/valorizacion.dart';
import 'package:flutter/material.dart';

class Acerca extends StatelessWidget {
  const Acerca({super.key});

  final double fontSize = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 90,
        title: const Text(
          "Acerca de",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Center(child: Text("Desarrollador", style: TextStyle(fontSize: 28))),
          const SizedBox(height: 10),
          Text("Diego Lara", style: TextStyle(fontSize: fontSize)),
          const SizedBox(height: 10),
          Center(child: Text("Contacto", style: TextStyle(fontSize: 28))),
          const SizedBox(height: 10),
          Text(
            "dilara23@alumnos.utalca.cl",
            style: TextStyle(fontSize: fontSize),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              "Idea de la aplicacion",
              style: TextStyle(fontSize: 28),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Se busca crear una aplicacion la cual pueda entregar toda la informacion necesaria sobre anime y manga, donde se incluye el estado del anime, si tiene manga, poder observar un trailer de este, etc.  ",
              style: TextStyle(fontSize: fontSize),
            ),
          ),
          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ValorizacionPage()),
            ),
            child: Text("Valorizacion", style: TextStyle(fontSize: 25)),
          ),
        ],
      ),
    );
  }
}
