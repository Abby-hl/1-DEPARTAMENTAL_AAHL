import 'package:flutter/material.dart';
import 'drawer_menu.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const AppScaffold({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Colors.deepPurple),
      drawer: const DrawerMenu(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: body,
      ),
    );
  }
}
