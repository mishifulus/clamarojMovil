import 'package:flutter/material.dart';
import 'package:clamaroj/widgets/input_decoration.dart';

class EditProductoScreen extends StatefulWidget {
  final Map<String, dynamic> initialValue;

  const EditProductoScreen({super.key, required this.initialValue});

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
        title: const Text('Editar producto'),
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