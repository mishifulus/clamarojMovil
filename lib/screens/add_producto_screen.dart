import 'package:clamaroj/widgets/input_decoration.dart';
import 'package:flutter/material.dart';

class AddProductoScreen extends StatefulWidget {
  const AddProductoScreen({super.key});


  @override
  _AddProductoScreenState createState() => _AddProductoScreenState();
}

class _AddProductoScreenState extends State<AddProductoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar nuevo producto'),
        backgroundColor: const Color.fromRGBO(236, 84, 42, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecorations.inputDecoration(hinttext: '12345', labeltext: 'Código', icono: const Icon(Icons.code)),
                    validator: (value)
                    {

                    },
                  ),
                  const SizedBox( height: 30,),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecorations.inputDecoration(hinttext: 'Producto', labeltext: 'Nombre', icono: const Icon(Icons.edit)),
                    validator: (value)
                    {

                    },
                  ),
                  const SizedBox( height: 30,),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecorations.inputDecoration(hinttext: 'Producto', labeltext: 'Descripción', icono: const Icon(Icons.edit)),
                    validator: (value)
                    {

                    },
                  ),
                  const SizedBox( height: 30,),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecorations.inputDecoration(hinttext: '100', labeltext: 'Precio', icono: const Icon(Icons.money)),
                    validator: (value)
                    {

                    },
                  ),
                  const SizedBox( height: 30,),
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecorations.inputDecoration(hinttext: '10', labeltext: 'Merma', icono: const Icon(Icons.money)),
                    validator: (value)
                    {

                    },
                  ),
                  const SizedBox( height: 30,),
                  ElevatedButton(
                    onPressed: () {

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
    );
  }
}