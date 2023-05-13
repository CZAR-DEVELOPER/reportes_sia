import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';
import 'package:reportes_sia_stable/views/admin/clientes/admin_clientes_editor_view.dart';

class AdminNotifier extends StateNotifier<dynamic> {
  AdminNotifier() : super(null);

  openColaboradoresEditor() {
    OneContext().showDialog(builder: (_) {
      return AdminClientesEditorView();
    });
  }
}

final adminProvider = StateNotifierProvider<AdminNotifier, dynamic>((ref) {
  return AdminNotifier();
});
