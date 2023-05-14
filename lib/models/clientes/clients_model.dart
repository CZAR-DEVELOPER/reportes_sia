// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:reportes_sia_stable/models/colaboradores/colaboradores_model.dart';

class ClientsModel {
  String? firebaseId;
  String nombre;
  String email;
  String password;
  List<ColaboradoresModel> listColaboradores;
  ClientsModel({
    this.firebaseId,
    required this.nombre,
    required this.email,
    required this.password,
    required this.listColaboradores,
  });

  ClientsModel copyWith({
    String? firebaseId,
    String? nombre,
    String? email,
    String? password,
    List<ColaboradoresModel>? listColaboradores,
  }) {
    return ClientsModel(
      firebaseId: firebaseId ?? this.firebaseId,
      nombre: nombre ?? this.nombre,
      email: email ?? this.email,
      password: password ?? this.password,
      listColaboradores: listColaboradores ?? this.listColaboradores,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firebaseId': firebaseId,
      'nombre': nombre,
      'email': email,
      'password': password,
      'listColaboradores': listColaboradores.map((x) => x.toMap()).toList(),
    };
  }

  factory ClientsModel.fromMap(Map<String, dynamic> map) {
    return ClientsModel(
      firebaseId:
          map['firebaseId'] != null ? map['firebaseId'] as String : null,
      nombre: map['nombre'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      listColaboradores: List<ColaboradoresModel>.from(
        (map['listColaboradores'] as List<int>).map<ColaboradoresModel>(
          (x) => ColaboradoresModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientsModel.fromJson(String source) =>
      ClientsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClientsModel(firebaseId: $firebaseId, nombre: $nombre, email: $email, password: $password, listColaboradores: $listColaboradores)';
  }

  @override
  bool operator ==(covariant ClientsModel other) {
    if (identical(this, other)) return true;

    return other.firebaseId == firebaseId &&
        other.nombre == nombre &&
        other.email == email &&
        other.password == password &&
        listEquals(other.listColaboradores, listColaboradores);
  }

  @override
  int get hashCode {
    return firebaseId.hashCode ^
        nombre.hashCode ^
        email.hashCode ^
        password.hashCode ^
        listColaboradores.hashCode;
  }
}
