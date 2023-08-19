import 'package:flutter/material.dart';
import 'package:clamaroj/models/materia.dart';
import 'package:clamaroj/screens/add_materia_screen.dart';
import 'package:clamaroj/screens/edit_materia_screen.dart';
import 'package:clamaroj/widgets/drawers.dart';
import 'package:provider/provider.dart';
import 'package:clamaroj/providers/materia_provider.dart';

class MateriasScreen extends StatefulWidget {
  const MateriasScreen({Key? key}) : super(key: key);

  @override
  _MateriasScreen createState() => _MateriasScreen();
}

class _MateriasScreen extends State<MateriasScreen>
{
  List<Materia> materias = [];


  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _agregarMateria() async {
    final materiaProvider = Provider.of<MateriaProvider>(context, listen: false);
    materias = materiaProvider.materias;

    final nuevoMateria = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddMateriaScreen()),
    );

    if(nuevoMateria != null && nuevoMateria is Materia)
    {
      if(await materiaProvider.postMateria(nuevoMateria))
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Materia prima agregada con éxito')));
        }
        else
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al agregar la materia prima')));
        }
      materias = materiaProvider.materias;
    }
  }

  Future<void> _fetch() async {
    final materiaProvider = Provider.of<MateriaProvider>(context, listen: false);
    materias = materiaProvider.materias;
  }

  void _navigarAEditar(int index) async {
    final materiaProvider = Provider.of<MateriaProvider>(context, listen: false);
    materias = materiaProvider.materias;

    final materiaEditado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditMateriaScreen(initialValue: materias[index]),
      )
    );

    if (materiaEditado != null)
    {
      final id = materias[index].id ?? 0;
      if(await materiaProvider.putMateria(id, materiaEditado))
      {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Materia prima editada con éxito')));
      }
      else
      {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al editar la materia prima')));
      }
      _fetch();
    }
  }

  @override
  Widget build(BuildContext context) {
    final materiaProvider = Provider.of<MateriaProvider>(context, listen: false);
    materias = materiaProvider.materias;

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
                        _displayAlert(context, index);
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
                        title: Text('${materias[index].codigo}'),
                        subtitle: Text('${materias[index].nombre}'),
                        trailing: IconButton(
                          onPressed: ()
                          {
                            _navigarAEditar(index);
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
            _agregarMateria();
          },
          elevation: 5,
          backgroundColor: const Color.fromRGBO(236, 84, 42, 1),
          child: const Icon(Icons.add),
        );
  }

  Future<void> _displayAlert(BuildContext context, int index) async {
  final materiaProvider = Provider.of<MateriaProvider>(context, listen: false);
  
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('¿Desea eliminar la materia prima ${materias[index].nombre}?'),
          actions: <Widget>[
            MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              child: const Text('Cancelar'),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
            MaterialButton(
              color: Colors.green,
              textColor: Colors.white,
              child: const Text('Aceptar'),
              onPressed: () async{
                if(await materiaProvider.deleteMateria(materias[index].id))
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Materia prima eliminada con éxito')));
                }
                else
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error al eliminar la materia prima')));
                }
                _fetch();
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
  }
}