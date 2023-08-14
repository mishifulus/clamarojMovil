import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


// 'https://localhost:7092/api/Auth/login '

final url = Uri.parse('https://localhost:7092/api/Auth/login');
final headers = {
  'accept': '*/*',
  'Content-Type': 'application/json',
};

class Login_provider with ChangeNotifier{
  int status = 0;

  getLogin(String correo, String pass) async {

    final body = {
      "correo": correo,
      "password": pass,
    };

    //final url = Uri.http("http://localhost:7092/api/Auth/login");
    final response = await http.post(url, headers: headers, body: jsonEncode(body));
    status = response.statusCode;

    if (response.statusCode == 200) {
      // La solicitud se realizó con éxito, puedes procesar la respuesta aquí
      print('Respuesta: ${response.body}');
    } else {
      // Manejar el error de la solicitud
      print('Error en la solicitud: ${response.statusCode}');
    }
    
    notifyListeners();
  }

}