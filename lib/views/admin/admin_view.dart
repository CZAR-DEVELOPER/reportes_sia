import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reportes_sia_stable/shared/shared.dart';
import 'package:reportes_sia_stable/views/admin/clientes/admin_clientes_view.dart';

class AdminView extends HookConsumerWidget {
  const AdminView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //THEME
    final globalTheme = Theme.of(context);

    return const Scaffold(
        body: Row(
      children: [
        UserNavigationRailShared(),
        Expanded(child: AdminClientesView()),
      ],
    ));
  }
}
