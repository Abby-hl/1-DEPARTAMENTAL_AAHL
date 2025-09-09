import 'package:flutter/material.dart';
import 'dart:math';
import 'app_scaffold.dart';

class HolaMundoIncremental extends StatefulWidget {
  const HolaMundoIncremental({super.key});

  @override
  State<HolaMundoIncremental> createState() => _HolaMundoIncrementalState();
}

class _HolaMundoIncrementalState extends State<HolaMundoIncremental> {
  List<String> mensajes = [];
  List<Color> colores = [];

  void agregarMensaje() {
    setState(() {
      mensajes.add('${mensajes.length + 1}. Hola Mundo');
      colores.add(
        Color.fromARGB(
          255,
          Random().nextInt(256),
          Random().nextInt(256),
          Random().nextInt(256),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Hola Mundo Incremental",
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: mensajes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: 1.0,
                  child: Center(
                    child: Text(
                      mensajes[index],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: colores[index],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: agregarMensaje,
              backgroundColor: Colors.pinkAccent,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
