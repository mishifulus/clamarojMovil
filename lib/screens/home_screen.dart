import 'package:flutter/material.dart';
import 'package:clamaroj/widgets/drawers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        backgroundColor: const Color.fromRGBO(236, 84, 42, 1),
      ),
      drawer: Drawers.drawer(title: "Menu Principal"),
      body: Center(
        child: Text("Bienvenido"),
      ),
    );
  }
}