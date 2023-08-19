import 'package:clamaroj/widgets/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:clamaroj/models/producto.dart';

class AddProductoScreen extends StatefulWidget {
  const AddProductoScreen({super.key});


  @override
  _AddProductoScreenState createState() => _AddProductoScreenState();
}

class _AddProductoScreenState extends State<AddProductoScreen> {

  final TextEditingController codigoController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController mermaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar nuevo producto'),
        backgroundColor: const Color.fromRGBO(236, 84, 42, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      autocorrect: false,
                      controller: codigoController,
                      decoration: InputDecorations.inputDecoration(hinttext: '12345', labeltext: 'Código', icono: const Icon(Icons.code)),
                      validator: (value)
                      {
                        String pattern = r'^[a-zA-Z0-9\s\-\.]+$';
                        RegExp regExp = RegExp(pattern);
                        return regExp.hasMatch(value ?? '')
                        ? null: 'El valor ingresado contiene caracteres incorrectos';
                      },
                    ),
                    const SizedBox( height: 30,),
                    TextFormField(
                      autocorrect: false,
                      controller: nombreController,
                      decoration: InputDecorations.inputDecoration(hinttext: 'Producto', labeltext: 'Nombre', icono: const Icon(Icons.edit)),
                      validator: (value)
                      {
                        String pattern = r'^[a-zA-Z0-9\s\-\.]+$';
                        RegExp regExp = RegExp(pattern);
                        return regExp.hasMatch(value ?? '')
                        ? null: 'El valor ingresado contiene caracteres incorrectos';
                      },
                    ),
                    const SizedBox( height: 30,),
                    TextFormField(
                      autocorrect: false,
                      controller: descripcionController,
                      decoration: InputDecorations.inputDecoration(hinttext: 'Producto', labeltext: 'Descripción', icono: const Icon(Icons.edit)),
                      validator: (value)
                      {
                        String pattern = r'^[a-zA-Z0-9\s\-\.]+$';
                        RegExp regExp = RegExp(pattern);
                        return regExp.hasMatch(value ?? '')
                        ? null: 'El valor ingresado contiene caracteres incorrectos';
                      },
                    ),
                    const SizedBox( height: 30,),
                    TextFormField(
                      autocorrect: false,
                      controller: precioController,
                      decoration: InputDecorations.inputDecoration(hinttext: '100', labeltext: 'Precio', icono: const Icon(Icons.money)),
                      validator: (value)
                      {
                        String pattern = r'^(?!0\d)(\d{1,3}(,\d{3})*|(\d+))(\.\d{1,2})?$';
                        RegExp regExp = RegExp(pattern);
                        return regExp.hasMatch(value ?? '')
                        ? null: 'El valor ingresado contiene caracteres incorrectos';
                      },
                    ),
                    const SizedBox( height: 30,),
                    TextFormField(
                      autocorrect: false,
                      controller: mermaController,
                      decoration: InputDecorations.inputDecoration(hinttext: '10', labeltext: 'Merma', icono: const Icon(Icons.money)),
                      validator: (value)
                      {
                        String pattern = r'^(?!0\d)(\d{1,3}(,\d{3})*|(\d+))(\.\d{1,2})?$';
                        RegExp regExp = RegExp(pattern);
                        return regExp.hasMatch(value ?? '')
                        ? null: 'El valor ingresado contiene caracteres incorrectos';
                      },
                    ),
                    const SizedBox( height: 30,),
                    ElevatedButton(
                      onPressed: () {
                        final codigo = codigoController.text;
                        final nombre = nombreController.text;
                        final descripcion = descripcionController.text;
                        final precio = int.tryParse(precioController.text) ?? 0;
                        final merma = int.tryParse(mermaController.text) ?? 0;
      
                        if (codigo.isNotEmpty && nombre.isNotEmpty && descripcion.isNotEmpty && precio != 0 && merma != 0)
                        {
                          final nuevoProducto = Producto(
                            idProducto: 0,
                            codigo: codigo,
                            nombre: nombre,
                            descripcion: descripcion,
                            precio: precio,
                            merma: merma,
                            foto:''
                          );
      
                          Navigator.pop(
                            context,
                            nuevoProducto
                          );
                        }
      
                      },style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(236, 84, 42, 1),)),
                      child: const Text('Agregar'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}