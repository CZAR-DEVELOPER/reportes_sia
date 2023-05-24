import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reportes_sia_stable/providers/providers.dart';
import 'package:reportes_sia_stable/widgets/slivers/sliver_widgets.dart';
import 'package:reportes_sia_stable/widgets/space/space_widgets.dart';
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

    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () => _adminProvider.openClientesEditor(),
            icon: const Icon(CupertinoIcons.add),
            label: const Text('Nuevo colaborador')),
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar(title: Text('Administrar clientes')),
            CustomSliverList(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                TextTitle('Administrar clientes'),
                Text('Crea, administra y elimina tus clientes'),
                SpaceY(),
                Row(
                  children: [
                    TextSubtitle('Mis clientes'),
                    Spacer(),
                    FilledButton.tonalIcon(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.search),
                        label: Text('Buscar cliente')),
                  ],
                ),
                SpaceY(),
                Divider(),
              ],
            ),
            /*CustomSliverList(children: [
              for (var i = 0; i < 100; i++)
                const ListTile(
                  leading: CircleAvatar(
                    child: Icon(CupertinoIcons.person),
                  ),
                  title: Text('Nombre del cliente'),
                  subtitle:
                      Opacity(opacity: .5, child: Text('email@ejemplo.com')),
                )
            ])*/
            CustomSliverList(children: [
              Padding(
                padding: const EdgeInsets.all(64),
                child: Opacity(
                  opacity: .25,
                  child: Text(
                    'Aún está vacio',
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ])
          ],
        ));
  }
}
