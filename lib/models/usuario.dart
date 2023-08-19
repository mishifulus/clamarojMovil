import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    int id;
    String nombre;
    String apellido;
    String correo;
    String password;
    String foto;
    DateTime fechaNacimiento;
    DateTime fechaRegistro;
    int idStatus;
    List<dynamic> rolesUsuario;
    dynamic proveedor;
    dynamic cliente;
    List<dynamic> pedidos;

    Usuario({
        required this.id,
        required this.nombre,
        required this.apellido,
        required this.correo,
        required this.password,
        required this.foto,
        required this.fechaNacimiento,
        required this.fechaRegistro,
        required this.idStatus,
        required this.rolesUsuario,
        required this.proveedor,
        required this.cliente,
        required this.pedidos,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        correo: json["correo"],
        password: json["password"],
        foto: json["foto"],
        fechaNacimiento: DateTime.parse(json["fechaNacimiento"]),
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        idStatus: json["idStatus"],
        rolesUsuario: List<dynamic>.from(json["rolesUsuario"].map((x) => x)),
        proveedor: json["proveedor"],
        cliente: json["cliente"],
        pedidos: List<dynamic>.from(json["pedidos"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
        "password": password,
        "foto": foto,
        "fechaNacimiento": fechaNacimiento.toIso8601String(),
        "fechaRegistro": fechaRegistro.toIso8601String(),
        "idStatus": idStatus,
        "rolesUsuario": List<dynamic>.from(rolesUsuario.map((x) => x)),
        "proveedor": proveedor,
        "cliente": cliente,
        "pedidos": List<dynamic>.from(pedidos.map((x) => x)),
    };
}