import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reportes_sia_stable/providers/providers.dart';
import 'package:reportes_sia_stable/widgets/slivers/sliver_widgets.dart';
import 'package:reportes_sia_stable/widgets/text/text_widget.dart';
import 'package:textfield_search/textfield_search.dart';

class AdminClientesView extends HookConsumerWidget {
  const AdminClientesView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //HOOKS
    TextEditingController searchController = TextEditingController();

    //PROVIDERS
    final _adminProvider = ref.read(adminProvider.notifier);

    Future<List> fetchData() async {
      await Future.delayed(const Duration(milliseconds: 1000));
      List list = [];
      String inputText = searchController.text;

      list.add('$inputText Item 1');
      list.add('$inputText Item 2');
      list.add('$inputText Item 3');
      return list;
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () => _adminProvider.openColaboradoresEditor(), icon: const Icon(CupertinoIcons.add), label: const Text('Nuevo colaborador')),
        body: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(title: Text('Administrar colaboradores')),
            const CustomSliverList(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                TextTitle('Administrar colaboradores'),
                Text('Crea, administra y elimina tus clientes'),
              ],
            ),
            CustomSliverStickyBar(
              children: Padding(
                padding: const EdgeInsets.all(16),
                child: TextFieldSearch(
                  minStringLength: 1,
                  label: 'Buscar',
                  decoration: const InputDecoration(prefixIcon: Icon(CupertinoIcons.search), hintText: 'Buscar colaborador'),
                  controller: searchController,
                  future: () => fetchData(),
                ),
              ),
            ),
            CustomSliverList(children: [
              for (var i = 0; i < 100; i++)
                const ListTile(
                  leading: CircleAvatar(
                    child: Icon(CupertinoIcons.building_2_fill),
                  ),
                  title: Text('Nombre del colaborador'),
                  subtitle: Opacity(opacity: .5, child: Text('email@ejemplo.com')),
                )
            ])
          ],
        ));
  }
}
