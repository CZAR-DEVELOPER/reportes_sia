// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ColaboradoresModel {
  String? firebaseId;
  String? imageUrl;
  String nombre;
  String email;
  String password;

  ColaboradoresModel({
    this.firebaseId,
    this.imageUrl,
    required this.nombre,
    required this.email,
    required this.password,
  });

  ColaboradoresModel copyWith({
    String? firebaseId,
    String? imageUrl,
    String? nombre,
    String? email,
    String? password,
  }) {
    return ColaboradoresModel(
      firebaseId: firebaseId ?? this.firebaseId,
      imageUrl: imageUrl ?? this.imageUrl,
      nombre: nombre ?? this.nombre,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firebaseId': firebaseId,
      'imageUrl': imageUrl,
      'nombre': nombre,
      'email': email,
      'password': password,
    };
  }

  factory ColaboradoresModel.fromMap(Map<String, dynamic> map) {
    return ColaboradoresModel(
      firebaseId: map['firebaseId'],
      imageUrl: map['imageUrl'],
      nombre: map['nombre'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ColaboradoresModel.fromJson(String source) => ColaboradoresModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ColaboradoresModel(firebaseId: $firebaseId, imageUrl: $imageUrl, nombre: $nombre, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ColaboradoresModel &&
        other.firebaseId == firebaseId &&
        other.imageUrl == imageUrl &&
        other.nombre == nombre &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return firebaseId.hashCode ^ imageUrl.hashCode ^ nombre.hashCode ^ email.hashCode ^ password.hashCode;
  }
}
