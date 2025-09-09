import 'package:flutter/material.dart';
import 'hola_mundo_simple.dart';
import 'hola_mundo_10.dart';
import 'hola_mundo_incremental.dart';
import 'registro.dart';
import 'piedra_papel_tijera.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  Widget _drawerItem(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text(
                "Menú de Prácticas",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            _drawerItem(
              context,
              "Práctica 1 - Hola Mundo Simple",
              const HolaMundoSimple(),
            ),
            _drawerItem(
              context,
              "Práctica 2 - Hola Mundo 10 veces",
              const HolaMundo10(),
            ),
            _drawerItem(
              context,
              "Práctica 3 - Hola Mundo Incremental",
              const HolaMundoIncremental(),
            ),
            _drawerItem(
              context,
              "Práctica 4 - Formulario de Registro",
              const RegistroPage(),
            ),
            _drawerItem(
              context,
              "Práctica 5 - Piedra, Papel o Tijera",
              const PiedraPapelTijera(),
            ),
          ],
        ),
      ),
    );
  }
}
