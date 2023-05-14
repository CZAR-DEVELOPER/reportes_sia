// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ColaboradoresModel {
  String? firebaseId;
  String nombre;
  String email;
  String password;
  ColaboradoresModel({
    this.firebaseId,
    required this.nombre,
    required this.email,
    required this.password,
  });

  ColaboradoresModel copyWith({
    String? firebaseId,
    String? nombre,
    String? email,
    String? password,
  }) {
    return ColaboradoresModel(
      firebaseId: firebaseId ?? this.firebaseId,
      nombre: nombre ?? this.nombre,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firebaseId': firebaseId,
      'nombre': nombre,
      'email': email,
      'password': password,
    };
  }

  factory ColaboradoresModel.fromMap(Map<String, dynamic> map) {
    return ColaboradoresModel(
      firebaseId:
          map['firebaseId'] != null ? map['firebaseId'] as String : null,
      nombre: map['nombre'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ColaboradoresModel.fromJson(String source) =>
      ColaboradoresModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ColaboradoresModel(firebaseId: $firebaseId, nombre: $nombre, email: $email, password: $password)';
  }

  @override
  bool operator ==(covariant ColaboradoresModel other) {
    if (identical(this, other)) return true;

    return other.firebaseId == firebaseId &&
        other.nombre == nombre &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return firebaseId.hashCode ^
        nombre.hashCode ^
        email.hashCode ^
        password.hashCode;
  }
}
