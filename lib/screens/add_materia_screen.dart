import 'package:clamaroj/widgets/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:clamaroj/models/materia.dart';

class AddMateriaScreen extends StatefulWidget {
  const AddMateriaScreen({super.key});


  @override
  _AddMateriaScreenState createState() => _AddMateriaScreenState();
}

class _AddMateriaScreenState extends State<AddMateriaScreen> {

  final TextEditingController codigoController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController descripcionController = TextEditingController();
  final TextEditingController perecederoController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController cantMinimaController = TextEditingController();
  final TextEditingController cantMaximaController = TextEditingController();
  final TextEditingController precioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar nuevo materia prima'),
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
                      controller: perecederoController,
                      decoration: InputDecorations.inputDecoration(hinttext: '10', labeltext: 'Días de perecidad', icono: const Icon(Icons.calendar_month)),
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
                      controller: stockController,
                      decoration: InputDecorations.inputDecoration(hinttext: '100', labeltext: 'Stock', icono: const Icon(Icons.numbers)),
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
                      controller: cantMinimaController,
                      decoration: InputDecorations.inputDecoration(hinttext: '100', labeltext: 'Cantidad Mínima', icono: const Icon(Icons.numbers)),
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
                      controller: cantMaximaController,
                      decoration: InputDecorations.inputDecoration(hinttext: '100', labeltext: 'Cantidad Máxima', icono: const Icon(Icons.numbers)),
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
                    ElevatedButton(
                      onPressed: () {
                        final codigo = codigoController.text;
                        final nombre = nombreController.text;
                        final descripcion = descripcionController.text;
                        final perecedero = int.tryParse(perecederoController.text) ?? 0;
                        final stock = int.tryParse(stockController.text) ?? 0;
                        final cantMinima = int.tryParse(cantMinimaController.text) ?? 0;
                        final cantMaxima = int.tryParse(cantMaximaController.text) ?? 0;
                        final precio = int.tryParse(precioController.text) ?? 0;
      
                        if (codigo.isNotEmpty && nombre.isNotEmpty && descripcion.isNotEmpty && precio != 0)
                        {
                          final nuevaMateria = Materia(
                            id: 0,
                            codigo: codigo,
                            nombre: nombre,
                            descripcion: descripcion,
                            perecedero: perecedero,
                            stock: stock,
                            cantMinima: cantMinima,
                            cantMaxima: cantMaxima,
                            precio: precio,
                            foto:''
                          );
      
                          Navigator.pop(
                            context,
                            nuevaMateria
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