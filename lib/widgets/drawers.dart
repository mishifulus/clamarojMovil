import 'package:flutter/material.dart';
import 'package:clamaroj/screens/home_screen.dart';
import 'package:clamaroj/screens/materias_screen.dart';
import 'package:clamaroj/screens/login_screen.dart';

class Drawers {
  static Drawer drawer({
    required String title,
  }) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              child: Text(
                title,
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
            Builder(
              builder: (BuildContext context) => ListTile(
                title: Text(
                  "Cerrar Sesión",
                  style: TextStyle(
                  color: Color.fromRGBO(236, 84, 42, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                    ),
                  ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}