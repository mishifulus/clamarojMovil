import 'dart:convert';

class Producto {
    int? idProducto;
    String? codigo;
    String? nombre;
    String? descripcion;
    int? precio;
    String? foto;
    int? merma;
    String? estatus;

    Producto({
        this.idProducto,
        this.codigo,
        this.nombre,
        this.descripcion,
        this.precio,
        this.foto,
        this.merma,
        this.estatus,
    });

    factory Producto.fromJson(String str) => Producto.fromMap(json.decode(str));
    String toJson() => json.encode(toMap());
    factory Producto.fromMap(Map<String, dynamic> json) => Producto(
        idProducto: json["idProducto"],
        codigo: json["codigo"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        foto: json["foto"],
        merma: json["merma"],
        estatus: json["estatus"],
    );

    Map<String, dynamic> toMap() => {
        "idProducto": idProducto,
        "codigo": codigo,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "foto": foto,
        "merma": merma,
        "estatus": estatus,
    };
}