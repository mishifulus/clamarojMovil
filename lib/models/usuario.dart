import 'dart:convert';

class Usuario {
    int? id;
    String? nombre;
    String? apellido;
    String? correo;
    String? password;
    String? foto;
    DateTime? fechaNacimiento;
    DateTime? fechaRegistro;
    int? idStatus;

    Usuario({
        this.id,
        this.nombre,
        this.apellido,
        this.correo,
        this.password,
        this.foto,
        this.fechaNacimiento,
        this.fechaRegistro,
        this.idStatus,
    });

    factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));
    String toJson() => json.encode(toMap());

    factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        correo: json["correo"],
        password: json["password"],
        foto: json["foto"],
        fechaNacimiento: DateTime.parse(json["fechaNacimiento"]),
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        idStatus: json["idStatus"]
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
        "password": password,
        "foto": foto,
        "fechaNacimiento": fechaNacimiento?.toIso8601String(),
        "fechaRegistro": fechaRegistro?.toIso8601String(),
        "idStatus": idStatus,
    };
}