import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    String correo;
    String password;

    Login({
        required this.correo,
        required this.password,
    });

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        correo: json["correo"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "correo": correo,
        "password": password,
    };
}