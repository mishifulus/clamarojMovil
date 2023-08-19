import 'package:clamaroj/models/usuarioc.dart';
import 'package:clamaroj/services/preferences.dart';
import 'package:flutter/material.dart';
import 'package:clamaroj/screens/home_screen.dart';
import 'package:clamaroj/screens/materias_screen.dart';
import 'package:clamaroj/screens/login_screen.dart';
import 'package:clamaroj/providers/authnotifier.dart';
import 'package:provider/provider.dart';

class Drawers {

  final BuildContext context;
  Drawers(this.context);

  Drawer drawer({
    required String title,
    
  }) {
    final authNotifier = Provider.of<AuthNotifier>(context);

    String infoText = authNotifier.isLoggedIn
        ? title + '\nUsuario: ${authNotifier.userEmail}'
        : title + '\nNot Logged In';
    
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 150,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(236, 84, 42, 1),
              ),
              child: 
              Text(
                infoText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Builder(
              builder: (BuildContext context) => ListTile(
                title: const Text(
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
                title: const Text(
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
                title: const Text(
                  "Cerrar Sesión",
                  style: TextStyle(
                  color: Color.fromRGBO(236, 84, 42, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                    ),
                  ),
                onTap: () {
                  authNotifier.logOut();
                  Preferences.usuario = Usuarioc();
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