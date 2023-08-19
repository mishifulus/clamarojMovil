import 'dart:convert';

class Usuarioc {
    int? id;

    Usuarioc({
        this.id,
    });

    factory Usuarioc.fromJson(String str) => Usuarioc.fromMap(json.decode(str));
    String toJson() => json.encode(toMap());

    factory Usuarioc.fromMap(Map<String, dynamic> json) => Usuarioc(
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
    };
}