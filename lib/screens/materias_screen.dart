import 'package:flutter/material.dart';
import 'package:clamaroj/widgets/drawers.dart';

class MateriasScreen extends StatefulWidget {
  const MateriasScreen({Key? key}) : super(key: key);

  @override
  _MateriasScreen createState() => _MateriasScreen();
}

class _MateriasScreen extends State<MateriasScreen>
{
  List<Map<String,dynamic>> materias = [];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materias Primas'),
        backgroundColor: const Color.fromRGBO(236, 84, 42, 1),
      ),
      drawer: Drawers(context).drawer(title: "Menu Principal"),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: ReorderableListView(
                children: <Widget>[
                  for (int index = 0; index < materias.length; index += 1)
                  Dismissible(
                    key: UniqueKey(),
                    background: Container(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction)
                    {
                      setState(() 
                      {
                        //_displayAlert(context, index);
                      });
                    },
                    secondaryBackground: Container(
                      color: const Color.fromARGB(255, 10, 17, 60),
                        child: const Align(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.delete, color: Colors.white),
                              Text(" Borrar  ",
                              style: TextStyle(color: Colors.white)),
                              SizedBox(width: 20,)
                            ],
                          )
                        )
                    ),
                    child: Card(
                      child: ListTile(
                        key: Key('$index'),
                        title: Text('${materias[index]['name']}'),
                        subtitle: Text('${materias[index]['description']}'),
                        trailing: IconButton(
                          onPressed: ()
                          {
                            //_navigateEdit(index);
                          },
                          icon: const Icon(Icons.edit),
                          splashRadius: 20,
                          padding: const EdgeInsets.all(3),
                        ),
                      ),
                    )
                  ),
                ],
                onReorder: (oldIndex, newIndex)
                {
                  setState(() 
                  {
                    if (oldIndex < newIndex)
                    {
                      newIndex -= 1;
                    }
                    //ELIMINAR Y AGREGAR 
                    //final contact = contactos.removeAt(oldIndex);
                   // contactos.insert(newIndex, contact);
                  });
                  //guardar cambios
                },
              ),
            ),
          )
        ],
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          botonAgregar(context),
        ],
      ),
    );
  }

  FloatingActionButton botonAgregar(BuildContext context) {
    return FloatingActionButton(
          onPressed: () {
            //_agregarContacto();
          },
          elevation: 5,
          backgroundColor: const Color.fromRGBO(236, 84, 42, 1),
          child: const Icon(Icons.add),
        );
  }
}