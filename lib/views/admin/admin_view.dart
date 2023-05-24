import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reportes_sia_stable/models/sidepanel/sidepaneldestination_model.dart';
import 'package:reportes_sia_stable/shared/shared.dart';
import 'package:reportes_sia_stable/views/admin/clientes/admin_clientes_view.dart';
import 'package:reportes_sia_stable/views/admin/colaboradores/admin_colaborador_view.dart';

class AdminView extends HookConsumerWidget {
  const AdminView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //THEME
    final globalTheme = Theme.of(context);

    //HOOKS
    final selectedIndex = useState<int>(0);

    //FUNCTIONS
    Widget selectedView(int selectedIndex) {
      switch (selectedIndex) {
        case 0:
          return AdminClientesView();
        case 1:
          return AdminColaboradoresView();
        default:
          return AdminClientesView();
      }
    }

    final List<SidePanelDestination> sidePanelDestinations = [
      SidePanelDestination(
          label: 'Cliente',
          route: 'admin-client',
          icon: Icon(CupertinoIcons.person)),
      SidePanelDestination(
          label: 'Colaborador',
          route: 'admin-client',
          icon: Icon(CupertinoIcons.building_2_fill)),
      SidePanelDestination(
          label: 'Limpiador',
          route: 'admin-client',
          icon: Icon(CupertinoIcons.folder)),
    ];

    return Scaffold(
        body: Row(
      children: [
        SidePanelShared(
            username: 'Nombre del administrador',
            email: 'email@ejemplo.com',
            role: 'Administrador',
            selectedIndex: selectedIndex,
            sidePanelDestinations: sidePanelDestinations),
        Expanded(child: selectedView(selectedIndex.value)),
      ],
    ));
  }
}
