import 'dart:convert';

class Materia {
    int? id;
    String? codigo;
    String? nombre;
    String? descripcion;
    int? perecedero;
    int? stock;
    int? cantMinima;
    int? cantMaxima;
    int? precio;
    String? foto;
    String? estatus;

    Materia({
        this.id,
        this.codigo,
        this.nombre,
        this.descripcion,
        this.perecedero,
        this.stock,
        this.cantMinima,
        this.cantMaxima,
        this.precio,
        this.foto,
        this.estatus,
    });

    factory Materia.fromJson(String str) => Materia.fromMap(json.decode(str));
    String toJson() => json.encode(toMap());
    factory Materia.fromMap(Map<String, dynamic> json) => Materia(
        id: json["id"],
        codigo: json["codigo"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        perecedero: json["perecedero"],
        stock: json["stock"],
        cantMinima: json["cantMinima"],
        cantMaxima: json["cantMaxima"],
        precio: json["precio"],
        foto: json["foto"],
        estatus: json["estatus"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "codigo": codigo,
        "nombre": nombre,
        "descripcion": descripcion,
        "perecedero": perecedero,
        "stock": stock,
        "cantMinima": cantMinima,
        "cantMaxima": cantMaxima,
        "precio": precio,
        "foto": foto,
        "estatus": estatus,
    };
}