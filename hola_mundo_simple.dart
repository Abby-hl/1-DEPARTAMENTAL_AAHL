import 'package:flutter/material.dart';
import 'app_scaffold.dart';

class HolaMundoSimple extends StatelessWidget {
  const HolaMundoSimple({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Hola Mundo Simple",
      body: const Center(
        child: Text(
          "Hello, World!",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
