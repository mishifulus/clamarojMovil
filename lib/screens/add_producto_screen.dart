import 'package:clamaroj/widgets/input_decoration.dart';
import 'package:flutter/material.dart';

class AddProductoScreen extends StatefulWidget {

  @override
  _AddProductoScreenState createState() => _AddProductoScreenState();
}

class _AddProductoScreenState extends State<AddProductoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar nuevo producto'),
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
                    child: Text('Agregar'),
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