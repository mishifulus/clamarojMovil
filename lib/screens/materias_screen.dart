import 'package:flutter/material.dart';
import 'package:clamaroj/screens/home_screen.dart';

class MateriasScreen extends StatelessWidget {
  const MateriasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materias Primas'),
        backgroundColor: const Color.fromRGBO(236, 84, 42, 1),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              child: Text(
                "Menu Principal",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              alignment: Alignment.center,
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromRGBO(236, 84, 42, 1),
              ),
            ),
            Builder(
              builder: (BuildContext context) => ListTile(
                title: Text(
                  "Productos",
                  style: TextStyle(
                  color: Color.fromRGBO(236, 84, 42, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
            ),
            Builder(
              builder: (BuildContext context) => ListTile(
                title: Text(
                  "Materias Primas",
                  style: TextStyle(
                  color: Color.fromRGBO(236, 84, 42, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                    ),
                  ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MateriasScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("Bienvenido a Materias"),
      ),
    );
  }
}