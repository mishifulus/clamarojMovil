import 'package:clamaroj/screens/add_producto_screen.dart';
import 'package:clamaroj/screens/edit_producto_screen.dart';
import 'package:flutter/material.dart';
import 'package:clamaroj/widgets/drawers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
{
  List<Map<String,dynamic>> productos = [];


  @override
  void initState() {
    super.initState();
  }

  Future<void> _agregarProducto() async {
    final nuevoProducto = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddProductoScreen()),
    );

    if(nuevoProducto != null && nuevoProducto is Map<String, dynamic>)
    {
      setState(()
      {
        //agregar
      });
      //guardar arreglo
    }
  }

  void _navigarAEditar(int index) async {
    final productoEditado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProductoScreen(initialValue: productos[index]),
      )
    );

    if (productoEditado != null)
    {
      setState(() 
      {
        productos[index] = productoEditado;
        //guardar  
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        backgroundColor: const Color.fromRGBO(236, 84, 42, 1),
      ),
      drawer: Drawers(context).drawer(title: "Menu Principal"),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: ReorderableListView(
                children: <Widget>[
                  for (int index = 0; index < productos.length; index += 1)
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
                        title: Text('${productos[index]['name']}'),
                        subtitle: Text('${productos[index]['description']}'),
                        trailing: IconButton(
                          onPressed: ()
                          {
                            _navigarAEditar(index);
                          },
                          icon: Icon(Icons.edit),
                          splashRadius: 20,
                          padding: EdgeInsets.all(3),
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
            _agregarProducto();
          },
          elevation: 5,
          child: const Icon(Icons.add),
          backgroundColor: Color.fromRGBO(236, 84, 42, 1),
        );
  }

  Future<void> _displayAlert(BuildContext context, int index) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('¿Desea eliminar el producto ${productos[index]['nombre']}?'),
          actions: <Widget>[
            MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Cancelar'),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
            MaterialButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text('Aceptar'),
              onPressed: () async{
                Navigator.pop(context);
                //vm.deleteRecord(_records[index]['id']);
                //_fetchRecords();
                //vm.showSnackBar(
                //  'Registro eliminado con éxito',context);
              },
            ),
          ],
        );
      });
  }

}