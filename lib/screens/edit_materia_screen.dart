import 'package:clamaroj/models/materia.dart';
import 'package:flutter/material.dart';
import 'package:clamaroj/widgets/input_decoration.dart';

class EditMateriaScreen extends StatefulWidget {
  final Materia initialValue;

  const EditMateriaScreen({super.key, required this.initialValue});

  @override
  _EditMateriaScreenState createState() => _EditMateriaScreenState();
}

class _EditMateriaScreenState extends State<EditMateriaScreen> {

  late TextEditingController idController;
  late TextEditingController codigoController;
  late TextEditingController nombreController;
  late TextEditingController descripcionController;
  late TextEditingController perecederoController;
  late TextEditingController stockController;
  late TextEditingController cantMinimaController;
  late TextEditingController cantMaximaController;
  late TextEditingController precioController;
  late TextEditingController estatusController;

  @override
  void initState()
  {
    super.initState();
    idController = TextEditingController(text: widget.initialValue.id.toString());
    codigoController = TextEditingController(text: widget.initialValue.codigo);
    nombreController = TextEditingController(text: widget.initialValue.nombre);
    descripcionController = TextEditingController(text: widget.initialValue.descripcion);
    precioController = TextEditingController(text: widget.initialValue.precio.toString());
    perecederoController = TextEditingController(text: widget.initialValue.perecedero.toString());
    stockController = TextEditingController(text: widget.initialValue.stock.toString());
    cantMaximaController = TextEditingController(text: widget.initialValue.cantMaxima.toString());
    cantMinimaController = TextEditingController(text: widget.initialValue.cantMinima.toString());
    estatusController = TextEditingController(text: widget.initialValue.estatus.toString());
  }

  @override
  void dispose() {
    idController.dispose();
    codigoController.dispose();
    nombreController.dispose();
    descripcionController.dispose();
    precioController.dispose();
    perecederoController.dispose();
    stockController.dispose();
    cantMinimaController.dispose();
    cantMaximaController.dispose();
    estatusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar materia prima'),
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
                      controller: idController,
                      decoration: InputDecorations.inputDecoration(hinttext: '12345', labeltext: 'ID', icono: const Icon(Icons.numbers)),
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
                    TextFormField(
                      autocorrect: false,
                      controller: estatusController,
                      decoration: InputDecorations.inputDecoration(hinttext: '0', labeltext: 'Estatus', icono: const Icon(Icons.check_box)),
                    ),
                    const SizedBox( height: 30,),
                    ElevatedButton(
                      onPressed: () {
                        final id = int.tryParse(idController.text) ?? 0;
                        final codigo = codigoController.text;
                        final nombre = nombreController.text;
                        final descripcion = descripcionController.text;
                        final precio = int.tryParse(precioController.text) ?? 0;
                        final perecedero = int.tryParse(perecederoController.text) ?? 0;
                        final stock = int.tryParse(stockController.text) ?? 0;
                        final cantMinima = int.tryParse(cantMinimaController.text) ?? 0;
                        final cantMaxima = int.tryParse(cantMaximaController.text) ?? 0;
                        //final estatus = estatusController.text;
      
                        if (codigo.isNotEmpty && nombre.isNotEmpty && descripcion.isNotEmpty && precio != 0 )
                        {
                          final materiaEditada = Materia(
                            id: id,
                            codigo: codigo,
                            nombre: nombre,
                            descripcion: descripcion,
                            precio: precio,
                            perecedero: perecedero,
                            stock: stock,
                            cantMinima: cantMinima,
                            cantMaxima: cantMaxima,
                            foto:''
                            //estatus: estatus,
                          );
      
                          Navigator.pop(
                            context,
                            materiaEditada
                          );
                        }
      
                      },style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(236, 84, 42, 1),)),
                      child: Text('Editar'),
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