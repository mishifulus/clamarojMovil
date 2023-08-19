import 'package:clamaroj/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


// 'https://localhost:7092/api/Auth/login 

class Usuario_provider with ChangeNotifier{

  final String _baseUrl = 'localhost:7092';

  List<Usuario> usuarios = [];
  
  UsuarioProvider()
  {
    getUsuarios();
  }

  Future<String> _getJsonData(String endpoint) async {
    final url = Uri.https(_baseUrl, endpoint);
    final response = await http.get(url);
    if(response.statusCode == 200)
    {
      return response.body;
    }
    else
    {
      print('HTTP Error: ${response.statusCode} - ${response.reasonPhrase}');
      return 'Error';
    }

  }

  Future<List<Usuario>> getUsuarios() async {
    final jsonData = await _getJsonData('api/Usuarios/usuariosp'); // Cambia la ruta si es diferente
    final data = json.decode(jsonData);

    List<Usuario> usuarios = [];

    data.forEach((elemento) {
      Usuario usuario = Usuario(
        id: elemento['id'],
        nombre: elemento['nombre'],
        apellido: elemento['apellido'],
        correo: elemento['correo'],
        password: elemento['password'],
        foto: elemento['foto'],
        fechaNacimiento: DateTime.parse(elemento['fechaNacimiento']),
        fechaRegistro: DateTime.parse(elemento['fechaRegistro']),
        idStatus: elemento['idStatus'],
        rolesUsuario: List<dynamic>.from(elemento['rolesUsuario'].map((x) => x)),
        proveedor: elemento['proveedor'],
        cliente: elemento['cliente'],
        pedidos: List<dynamic>.from(elemento['pedidos'].map((x) => x)),
      );

      usuarios.add(usuario);
    });

    return usuarios;
  }

}