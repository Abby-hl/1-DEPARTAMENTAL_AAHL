import 'package:flutter/material.dart';
import 'dart:math';
import 'app_scaffold.dart';

class PiedraPapelTijera extends StatefulWidget {
  const PiedraPapelTijera({super.key});

  @override
  State<PiedraPapelTijera> createState() => _PiedraPapelTijeraState();
}

class _PiedraPapelTijeraState extends State<PiedraPapelTijera> {
  int usuarioScore = 0;
  int computadoraScore = 0;
  String resultado = "";
  String eleccionUsuario = "";
  String eleccionPC = "";

  final opciones = ["Piedra", "Papel", "Tijera"];
  final coloresOpciones = [
    Colors.redAccent,
    Colors.greenAccent,
    Colors.blueAccent,
  ];

  void jugar(String eleccion) {
    final pc = opciones[Random().nextInt(3)];
    String res = "";

    if (eleccion == pc) {
      res = "Empate";
    } else if ((eleccion == "Piedra" && pc == "Tijera") ||
        (eleccion == "Papel" && pc == "Piedra") ||
        (eleccion == "Tijera" && pc == "Papel")) {
      res = "Ganaste";
      usuarioScore++;
    } else {
      res = "Perdiste";
      computadoraScore++;
    }

    setState(() {
      eleccionUsuario = eleccion;
      eleccionPC = pc;
      resultado = res;
    });
  }

  void reiniciar() {
    setState(() {
      usuarioScore = 0;
      computadoraScore = 0;
      resultado = "";
      eleccionUsuario = "";
      eleccionPC = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Piedra, Papel o Tijera",
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "Elige tu opción:",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(opciones.length, (index) {
                return ElevatedButton(
                  onPressed: () => jugar(opciones[index]),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: coloresOpciones[index],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    opciones[index],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            if (resultado.isNotEmpty)
              Card(
                color: Colors.white.withOpacity(0.2),
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Tu elección: $eleccionUsuario",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Computadora: $eleccionPC",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Resultado: $resultado",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellowAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 30),
            Card(
              color: Colors.white.withOpacity(0.2),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Usuario: $usuarioScore",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "PC: $computadoraScore",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: reiniciar,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              child: const Text("Reiniciar Marcador"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
