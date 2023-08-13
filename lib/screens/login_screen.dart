import 'package:flutter/material.dart';
import 'package:clamaroj/widgets/input_decoration.dart';

class LoginScreen extends StatelessWidget {
const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //Metodo que devuelve el tamaño de la pantalla

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity, //Abarca desde el extremo superior al inferior
        child: Stack( //Conjunto de widgets
          children: [
            fondoDecorado(size),
            icono(),
            loginForm(context),
          ],
        )
        ),
    );
  }

  SingleChildScrollView loginForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  width: double.infinity,
                  height: 420,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [ BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15, //Efecto blur
                      offset: Offset(0,5), //Dirección
                    )],
                  ),
                  child: Column(
                    children: [
                      const SizedBox( height: 10,),
                      Text('Inicio de Sesión',
                          style: Theme.of(context).textTheme.headlineSmall,),
                      const SizedBox( height: 30,),
                      Container(
                        child: Form( //Para validar las entradas
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              TextFormField(
                                autocorrect: false,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecorations.inputDecoration(
                                  hinttext: 'ejemplo@correo.com', labeltext: 'Correo electrónico', icono: const Icon(Icons.alternate_email_rounded),),
                                validator: (value) 
                                {
                                  String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                                  RegExp regExp = new RegExp(pattern);
                                  return regExp.hasMatch(value ?? '')
                                  ? null: 'El valor ingresado no es un correo';
                                },
                              ),
                              const SizedBox( height: 30,),
                              TextFormField(
                                autocorrect: false,
                                obscureText: true,
                                decoration: InputDecorations.inputDecoration(
                                  hinttext: '*****', labeltext: 'Contraseña', icono: const Icon(Icons.lock_open_outlined),),
                                  validator: (value) 
                                {
                                  return (value != null && value.length >= 5)
                                  ? null
                                  : 'La contraseña tiene mínimo 5 caracteres';
                                },
                              ),
                              const SizedBox(height: 30,),
                              MaterialButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                disabledColor: Colors.grey,
                                color: Color.fromRGBO(236, 84, 42, 1),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                                  child: Text('Ingresar', style: TextStyle(color: Colors.white),),
                                ),
                                onPressed: () => {
                                  Navigator.pushNamed(context, 'home')
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox( height: 50,),
                const Text('Crear una nueva cuenta',
                style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.bold),)
              ],
            ),
    );
  }

  SafeArea icono() {
    return SafeArea(
            child: Container(
              width: 300,
              height: 200,
              margin: const EdgeInsets.only(left:30), //Margen
               child:
                Center(
                  child: Image(
                    image: AssetImage('assets/images/logoinicio.png'),
                    fit: BoxFit.cover
                    ),
                ),
            ),
          );
  }

  Container fondoDecorado(Size size) {
    return Container(
            decoration: const BoxDecoration( //const porque son valores que no van a cambiar
              gradient: LinearGradient(
                colors: [Color.fromRGBO(255, 61, 0, 1), 
                Color.fromRGBO(183, 28, 28, 1)]
              ),
            ),
            width: double.infinity,
            height: size.height * 0.4, //Ajusta el tamaño
            child: Stack(
              children: [
                Positioned(
                  top: 90,
                  left: 20,
                  child: burbuja()
                ),
                Positioned(
                  top: -10,
                  left: -5,
                  child: burbuja()
                ),
                Positioned(
                  top: 30,
                  left: 70,
                  child: burbuja()
                ),
                Positioned(
                  top: 150,
                  left: 50,
                  child: burbuja()
                ),
                Positioned(
                  top: 210,
                  left: 5,
                  child: burbuja()
                ),
                Positioned(
                  top: 90,
                  right: 20,
                  child: burbuja()
                ),
                Positioned(
                  top: -10,
                  right: -5,
                  child: burbuja()
                ),
                Positioned(
                  top: 30,
                  right: 70,
                  child: burbuja()
                ),
                Positioned(
                  top: 150,
                  right: 50,
                  child: burbuja()
                ),
                Positioned(
                  top: 210,
                  right: 5,
                  child: burbuja()
                ),
              ],
            ),
          );
  }

  Container burbuja() {
    return Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromRGBO(255, 85, 1, 1)
                ),
              );
  }
}