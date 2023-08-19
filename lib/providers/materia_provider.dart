import 'package:clamaroj/models/materia.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MateriaProvider extends ChangeNotifier{
  final String _baseUrl = 'localhost:7092';

  List<Materia> materias = [];
  int status = 0;

  MateriaProvider(){
    getMaterias();
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

  Future<List<Materia>> getMaterias() async {
    final jsonData = await _getJsonData('api/MateriaPrimas');
    final data = json.decode(jsonData);

    data.forEach((elemento) {
      Materia materia = Materia();
      materia.id = elemento['id'];
      materia.codigo = elemento['codigo'];
      materia.nombre = elemento['nombre'];
      materia.descripcion = elemento['descripcion'];
      materia.perecedero = elemento['perecedero'];
      materia.stock = elemento['stock'];
      materia.cantMinima = elemento['cantMinima'];
      materia.cantMaxima = elemento['cantMaxima'];
      materia.precio = elemento['precio'];
      materia.foto = elemento['foto'];
      materia.estatus = elemento['estatus'];

      materias.add(materia);
    });
    return materias;
  }

  Future<bool> deleteMateria(int? id) async {
    final url = Uri.https('localhost:7092', 'api/MateriaPrimas/$id');
    bool correct;

    final response = await http.delete(url);

    if (response.statusCode == 204) {
      print('Materia prima eliminada con éxito');
      correct = true;
      // Puedes realizar cualquier acción adicional que necesites aquí
    } else {
      print('Error al eliminar la materia prima: ${response.statusCode}');
      correct = false;
      // Puedes manejar el error de acuerdo a tus necesidades
    }
    return correct;
  }

  Future<bool> postMateria(Materia materia) async {
    bool correct;
    final String baseUrl = 'https://localhost:7092/api/MateriaPrimas';

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(materia.toMap()), // Asegúrate de que tu clase Producto tenga un método toMap()
    );

    if (response.statusCode == 201) {
      print('Materia prima agregada con éxito');
      correct = true;
      // Puedes realizar cualquier acción adicional que necesites aquí
    } else {
      print('Error al agregar la materia prima: ${response.statusCode}');
      correct = false;
      // Puedes manejar el error de acuerdo a tus necesidades
    }
    return correct;
  }

  Future<bool> putMateria(int id, Materia materia) async {
    bool correct;
    final String baseUrl = 'https://localhost:7092/api/MateriaPrimas';

    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(materia.toMap()), // Asegúrate de que tu clase Producto tenga un método toMap()
    );

    if (response.statusCode == 204) {
      print('Materia prima editada con éxito');
      correct = true;
      // Puedes realizar cualquier acción adicional que necesites aquí
    } else {
      print('Error al editar la materia prima: ${response.statusCode}');
      correct = false;
      // Puedes manejar el error de acuerdo a tus necesidades
    }
    return correct;
  }


}