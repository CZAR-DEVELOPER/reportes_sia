import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';
import 'package:reportes_sia_stable/widgets/space/space_widgets.dart';
import 'package:textfield_search/textfield_search.dart';

class AdminClientesEditorView extends HookConsumerWidget {
  const AdminClientesEditorView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //THEME
    final globalTheme = Theme.of(context);

    //HOOKS
    TextEditingController searchController = TextEditingController();

    //FUNCTIONS
    Future<List> fetchData() async {
      await Future.delayed(const Duration(milliseconds: 1000));
      List list = [];
      String inputText = searchController.text;

      list.add('$inputText Item 1');
      list.add('$inputText Item 2');
      list.add('$inputText Item 3');
      return list;
    }

    return AlertDialog(
      scrollable: true,
      title: Text('Crear cliente'),
      content: Container(
        width: 500,
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
              decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.person),
                  hintText: 'Nombre del cliente'),
            ),
            SpaceY(),
            Text('Credenciales'),
            SpaceY(),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.mail),
                  hintText: 'Correo electronico'),
            ),
            SpaceY(),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.lock),
                  hintText: 'Contraseña'),
            ),
            SpaceY(
              percent: 2,
            ),
            Divider(),
            SpaceY(),
            Text('Colaboradores seleccionados'),
            SpaceY(),
            TextFieldSearch(
              decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.search),
                  hintText: 'Buscar colaborador'),
              label: 'Buscar colaborador',
              controller: searchController,
              future: () => fetchData(),
            ),
            ListTile(
              tileColor:
                  globalTheme.colorScheme.surfaceVariant.withOpacity(.05),
              leading:
                  CircleAvatar(child: Icon(CupertinoIcons.building_2_fill)),
              title: Text('Colaborador'),
              trailing: IconButton(
                  onPressed: () {}, icon: Icon(CupertinoIcons.delete)),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => OneContext().popDialog(), child: Text('Cancelar')),
        FilledButton(onPressed: () {}, child: Text('Crear cliente')),
      ],
    );
  }
}
