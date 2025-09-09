import 'package:flutter/material.dart';
import 'dart:math';
import 'app_scaffold.dart';

class HolaMundo10 extends StatefulWidget {
  const HolaMundo10({super.key});

  @override
  State<HolaMundo10> createState() => _HolaMundo10State();
}

class _HolaMundo10State extends State<HolaMundo10> {
  List<String> mensajes = [];
  List<Color> colores = [];
  List<double> opacidades = List.filled(10, 0.0);

  void mostrarMensajes() {
    setState(() {
      mensajes = List.generate(10, (index) => "¡Hola Mundo!");
      colores = List.generate(
        10,
        (index) => Color.fromARGB(
          255,
          Random().nextInt(256),
          Random().nextInt(256),
          Random().nextInt(256),
        ),
      );
      opacidades = List.filled(10, 0.0);
    });

    for (int i = 0; i < 10; i++) {
      Future.delayed(Duration(milliseconds: 150 * i), () {
        setState(() {
          opacidades[i] = 1.0;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Hola Mundo 10 veces",
      body: Column(
        children: [
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: mostrarMensajes,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pinkAccent,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              "Mostrar Hola Mundo",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: mensajes.length,
              itemBuilder: (context, index) {
                return AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: opacidades[index],
                  child: Center(
                    child: Text(
                      mensajes[index],
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: colores[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
