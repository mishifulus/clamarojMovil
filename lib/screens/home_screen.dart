import 'package:clamaroj/models/producto.dart';
import 'package:clamaroj/screens/add_producto_screen.dart';
import 'package:clamaroj/screens/edit_producto_screen.dart';
import 'package:flutter/material.dart';
import 'package:clamaroj/widgets/drawers.dart';
import 'package:provider/provider.dart';
import 'package:clamaroj/providers/producto_provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
{

  List<Producto> productos = [];

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _agregarProducto() async {
    final productoProvider = Provider.of<ProductoProvider>(context, listen: false);
    productos = productoProvider.productos;

    final nuevoProducto = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddProductoScreen()),
    );

    if(nuevoProducto != null && nuevoProducto is Producto)
    {
      if(await productoProvider.postProducto(nuevoProducto))
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Producto agregado con éxito')));
        }
        else
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al agregar el producto')));
        }
      productos = productoProvider.productos;
    }
  }

  Future<void> _fetch() async {
    final productoProvider = Provider.of<ProductoProvider>(context, listen: false);
    productos = productoProvider.productos;
  }

  void _navigarAEditar(int index) async {
    final productoProvider = Provider.of<ProductoProvider>(context, listen: false);
    productos = productoProvider.productos;

    final productoEditado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProductoScreen(initialValue: productos[index]),
      )
    );

    if (productoEditado != null)
    {
      final id = productos[index].idProducto ?? 0;
      if(await productoProvider.putProducto(id, productoEditado))
      {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Producto editado con éxito')));
      }
      else
      {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al editado el producto')));
      }
      _fetch();
    }
  }

  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context, listen: false);
    productos = productoProvider.productos;

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
                        title: Text('${productos[index].codigo}'),
                        subtitle: Text('${productos[index].nombre}'),
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
            _agregarProducto();
          },
          elevation: 5,
          backgroundColor: const Color.fromRGBO(236, 84, 42, 1),
          child: const Icon(Icons.add),
        );
  }

  Future<void> _displayAlert(BuildContext context, int index) async {
  final productoProvider = Provider.of<ProductoProvider>(context, listen: false);
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('¿Desea eliminar el producto ${productos[index].nombre}?'),
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
                if(await productoProvider.deleteProducto(productos[index].idProducto))
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Producto eliminado con éxito')));
                }
                else
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error al eliminar el producto')));
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