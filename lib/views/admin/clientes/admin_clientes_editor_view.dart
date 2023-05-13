import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';
import 'package:reportes_sia_stable/widgets/space/space_widgets.dart';

class AdminClientesEditorView extends HookConsumerWidget {
  const AdminClientesEditorView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text('Crear colaborador'),
      content: Container(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
                alignment: Alignment.center,
                child: IconButton.filledTonal(
                    onPressed: () {},
                    icon: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Icon(CupertinoIcons.camera),
                    ))),
            SpaceY(),
            Text('Datos basicos'),
            SpaceY(),
            TextField(
              decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.person), hintText: 'Nombre del colaborador'),
            ),
            SpaceY(),
            Text('Credenciales'),
            SpaceY(),
            TextField(
              decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.mail), hintText: 'Correo electronico'),
            ),
            SpaceY(),
            TextField(
              decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.lock), hintText: 'Contraseña'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => OneContext().popAllDialogs(), child: Text('Cancelar')),
        FilledButton(onPressed: () {}, child: Text('Crear colaborador')),
      ],
    );
  }
}
