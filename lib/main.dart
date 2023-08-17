import 'package:clamaroj/providers/login_provider.dart';
import 'package:clamaroj/providers/authnotifier.dart';
import 'package:clamaroj/screens/home_screen.dart';
import 'package:clamaroj/screens/login_screen.dart';
import 'package:clamaroj/screens/materias_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Login_provider()),
        ChangeNotifierProvider(create: (_) => AuthNotifier())], //Otro provider
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: {
          'login': (_) => LoginScreen(),
          'productos': (_) => HomeScreen(),
          'materias': (_) => MateriasScreen(),
        },
        initialRoute: 'login',
      ),
    );
  }
}