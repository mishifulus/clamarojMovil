import 'package:clamaroj/providers/materia_provider.dart';
import 'package:clamaroj/providers/usuario_provider.dart';
import 'package:clamaroj/providers/authnotifier.dart';
import 'package:clamaroj/providers/producto_provider.dart';
import 'package:clamaroj/screens/home_screen.dart';
import 'package:clamaroj/screens/login_screen.dart';
import 'package:clamaroj/screens/materias_screen.dart';
import 'package:clamaroj/services/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Usuario_provider()),
        ChangeNotifierProvider(create: (_) => AuthNotifier()),
        ChangeNotifierProvider(create: (_) => ProductoProvider()),
        ChangeNotifierProvider(create: (_) => MateriaProvider())
        ], //Otro provider
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: {
          'login': (_) => LoginScreen(),
          'productos': (_) => HomeScreen(),
          'materias': (_) => MateriasScreen(),
        },
        initialRoute: Preferences.usuarioc.id != null ? 'productos' : 'login',
        //initialRoute: 'login',
      ),
    );
  }
}