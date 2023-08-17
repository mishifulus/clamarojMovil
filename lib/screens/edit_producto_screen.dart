import 'package:flutter/material.dart';
import 'package:clamaroj/widgets/input_decoration.dart';

class EditProductoScreen extends StatefulWidget {
  final Map<String, dynamic> initialValue;

  EditProductoScreen({required this.initialValue});

  @override
  _EditProductoScreenState createState() => _EditProductoScreenState();
}

class _EditProductoScreenState extends State<EditProductoScreen> {

  @override
  void initState()
  {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar producto'),
        backgroundColor: const Color.fromRGBO(236, 84, 42, 1),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecorations.inputDecoration(hinttext: '12345', labeltext: 'Código', icono: Icon(Icons.code)),
                    validator: (value)
                    {

                    },
                  ),
                  SizedBox( height: 30,),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecorations.inputDecoration(hinttext: 'Producto', labeltext: 'Nombre', icono: Icon(Icons.edit)),
                    validator: (value)
                    {

                    },
                  ),
                  SizedBox( height: 30,),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecorations.inputDecoration(hinttext: 'Producto', labeltext: 'Descripción', icono: Icon(Icons.edit)),
                    validator: (value)
                    {

                    },
                  ),
                  SizedBox( height: 30,),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecorations.inputDecoration(hinttext: '100', labeltext: 'Precio', icono: Icon(Icons.money)),
                    validator: (value)
                    {

                    },
                  ),
                  SizedBox( height: 30,),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecorations.inputDecoration(hinttext: '10', labeltext: 'Merma', icono: Icon(Icons.money)),
                    validator: (value)
                    {

                    },
                  ),
                  SizedBox( height: 30,),
                  ElevatedButton(
                    onPressed: () {

                    },style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(236, 84, 42, 1),)),
                    child: Text('Editar'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}