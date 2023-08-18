import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


// 'https://localhost:7092/api/Auth/login 

class Login_provider with ChangeNotifier{

  final String _baseUrl = 'localhost:7092';
  final headers = {
    'accept': '*/*',
    'Content-Type': 'application/json; charset=UTF-8',
  };
  int status = 0;

  getLogin(String correo, String pass) async {

    final url = Uri.https(_baseUrl, 'api/Auth/login');
    final body = {
      "correo": correo,
      "password": pass,
    };

    final response = await http.post(url, body: jsonEncode(body));
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