import 'package:clamaroj/models/producto.dart';
import 'package:flutter/material.dart';
import 'package:clamaroj/widgets/input_decoration.dart';

class EditProductoScreen extends StatefulWidget {
  final Producto initialValue;

  const EditProductoScreen({super.key, required this.initialValue});

  @override
  _EditProductoScreenState createState() => _EditProductoScreenState();
}

class _EditProductoScreenState extends State<EditProductoScreen> {

  late TextEditingController idProductoController;
  late TextEditingController codigoController;
  late TextEditingController nombreController;
  late TextEditingController descripcionController;
  late TextEditingController precioController;
  late TextEditingController mermaController;
  late TextEditingController estatusController;

  @override
  void initState()
  {
    super.initState();
    idProductoController = TextEditingController(text: widget.initialValue.idProducto.toString());
    codigoController = TextEditingController(text: widget.initialValue.codigo);
    nombreController = TextEditingController(text: widget.initialValue.nombre);
    descripcionController = TextEditingController(text: widget.initialValue.descripcion);
    precioController = TextEditingController(text: widget.initialValue.precio.toString());
    mermaController = TextEditingController(text: widget.initialValue.merma.toString());
    estatusController = TextEditingController(text: widget.initialValue.estatus.toString());
  }

  @override
  void dispose() {
    idProductoController.dispose();
    codigoController.dispose();
    nombreController.dispose();
    descripcionController.dispose();
    precioController.dispose();
    mermaController.dispose();
    estatusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar producto'),
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
                      controller: idProductoController,
                      decoration: InputDecorations.inputDecoration(hinttext: '1', labeltext: 'ID Producto', icono: const Icon(Icons.numbers)),
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
                    TextFormField(
                      autocorrect: false,
                      controller: estatusController,
                      decoration: InputDecorations.inputDecoration(hinttext: '0', labeltext: 'Estatus', icono: const Icon(Icons.check_box)),
                    ),
                    const SizedBox( height: 30,),
                    ElevatedButton(
                      onPressed: () {
                        final id = int.tryParse(idProductoController.text) ?? 0;
                        final codigo = codigoController.text;
                        final nombre = nombreController.text;
                        final descripcion = descripcionController.text;
                        final precio = int.tryParse(precioController.text) ?? 0;
                        final merma = int.tryParse(mermaController.text) ?? 0;
                        //final estatus = estatusController.text;
      
                        if (codigo.isNotEmpty && nombre.isNotEmpty && descripcion.isNotEmpty && precio != 0 && merma != 0)
                        {
                          final productoEditado = Producto(
                            idProducto: id,
                            codigo: codigo,
                            nombre: nombre,
                            descripcion: descripcion,
                            precio: precio,
                            merma: merma,
                            foto:''
                            //estatus: estatus,
                          );
      
                          Navigator.pop(
                            context,
                            productoEditado
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