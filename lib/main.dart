import 'package:clamaroj/providers/login_provider.dart';
import 'package:clamaroj/screens/home_screen.dart';
import 'package:clamaroj/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Login_provider(),)], //Otro provider
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => HomeScreen(),
        },
        initialRoute: 'login',
      ),
    );
  }
}