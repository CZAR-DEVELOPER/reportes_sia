import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';
import 'package:reportes_sia_stable/models/colaboradores/colaboradores_model.dart';
import 'package:reportes_sia_stable/views/admin/clientes/admin_clientes_editor_view.dart';
import 'package:reportes_sia_stable/views/admin/colaboradores/admin_colaborador_view.dart';
import 'package:reportes_sia_stable/views/admin/colaboradores/admin_colaborador_editor_view.dart';

class AdminNotifier extends StateNotifier<dynamic> {
  AdminNotifier() : super(null);

  //CLIENTES
  openClientesEditor() {
    OneContext().showDialog(
        barrierDismissible: false,
        useRootNavigator: false,
        builder: (_) {
          return AdminClientesEditorView();
        });
  }

  crearCliente(String nombre, String email, String password) {
    final newColaborador = ColaboradoresModel(nombre: nombre, email: email, password: password);
  }

  openColaboradoresEditor() {
    OneContext().showDialog(
        barrierDismissible: false,
        useRootNavigator: false,
        builder: (_) {
          return AdminColaboradoresEditorView();
        });
  }
}

final adminProvider = StateNotifierProvider<AdminNotifier, dynamic>((ref) {
  return AdminNotifier();
});
