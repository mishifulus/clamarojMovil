import 'package:clamaroj/models/producto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductoProvider extends ChangeNotifier{
  final String _baseUrl = 'localhost:7092';

  List<Producto> productos = [];
  int status = 0;

  ProductoProvider(){
    getProductos();
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

  getProductos() async {
    final jsonData = await _getJsonData('api/Productos');
    final data = json.decode(jsonData);

    data.forEach((elemento) {
      Producto producto = Producto();
      producto.idProducto = elemento['idProducto'];
      producto.codigo = elemento['codigo'];
      producto.nombre = elemento['nombre'];
      producto.descripcion = elemento['descripcion'];
      producto.precio = elemento['precio'];
      producto.foto = elemento['foto'];
      producto.merma = elemento['merma'];
      producto.estatus = elemento['estatus'];

      productos.add(producto);
    });
    notifyListeners();
  }

  Future<bool> deleteProducto(int? id) async {
    final url = Uri.https('localhost:7092', 'api/Productos/$id');
    bool correct;

    final response = await http.delete(url);

    if (response.statusCode == 204) {
      print('Producto eliminado con éxito');
      correct = true;
      // Puedes realizar cualquier acción adicional que necesites aquí
    } else {
      print('Error al eliminar el producto: ${response.statusCode}');
      correct = false;
      // Puedes manejar el error de acuerdo a tus necesidades
    }
    return correct;
  }

  Future<bool> postProducto(Producto producto) async {
    bool correct;
    final String baseUrl = 'https://localhost:7092/api/Productos';

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(producto.toMap()), // Asegúrate de que tu clase Producto tenga un método toMap()
    );

    if (response.statusCode == 201) {
      print('Producto agregado con éxito');
      correct = true;
      // Puedes realizar cualquier acción adicional que necesites aquí
    } else {
      print('Error al agregar el producto: ${response.statusCode}');
      correct = false;
      // Puedes manejar el error de acuerdo a tus necesidades
    }
    return correct;
  }

  Future<bool> putProducto(int id, Producto producto) async {
    bool correct;
    final String baseUrl = 'https://localhost:7092/api/Productos';

    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(producto.toMap()), // Asegúrate de que tu clase Producto tenga un método toMap()
    );

    if (response.statusCode == 200) {
      print('Producto editado con éxito');
      correct = true;
      // Puedes realizar cualquier acción adicional que necesites aquí
    } else {
      print('Error al editar el producto: ${response.statusCode}');
      correct = false;
      // Puedes manejar el error de acuerdo a tus necesidades
    }
    return correct;
  }


}