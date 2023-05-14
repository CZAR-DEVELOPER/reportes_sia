import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reportes_sia_stable/models/models.dart';
import 'package:reportes_sia_stable/providers/providers.dart';

import 'package:reportes_sia_stable/widgets/widgets.dart';

class SidePanelShared extends HookConsumerWidget {
  final String username;
  final String email;
  final String role;
  final ValueNotifier<int> selectedIndex;
  final List<SidePanelDestination> sidePanelDestinations;

  SidePanelShared({
    super.key,
    required this.selectedIndex,
    required this.sidePanelDestinations,
    required this.username,
    required this.email,
    required this.role,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //HOOKS
    final viewIndex = useState<int>(0);

    //THEME
    final globalTheme = Theme.of(context);

    //PROVIDERS
    final _loginProvider = ref.read(loginProvider.notifier);

    //

    return Row(
      children: [
        Container(
          color: globalTheme.colorScheme.surfaceVariant.withOpacity(.05),
          width: 304,
          child: Column(
            children: [
              const SpaceY(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Image(
                    image: AssetImage('assets/brand/logo_invertido.webp'),
                    width: 150,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Nombre del usuario',
                      style: globalTheme.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Opacity(
                        opacity: .5,
                        child: Text(
                          'email@ejemplo.com',
                        )),
                    const SpaceY(),
                    Text(
                      'Administrador',
                      style: globalTheme.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              for (var i = 0; i < sidePanelDestinations.length; i++)
                ListTile(
                  onTap: () {
                    selectedIndex.value = i;
                  },
                  selected: i == selectedIndex.value ? true : false,
                  leading: Icon(sidePanelDestinations[i].icon),
                  title: Text(sidePanelDestinations[i].label),
                ),
              const Spacer(),
              ListTile(
                onTap: () => _loginProvider.logout(),
                leading: const Icon(CupertinoIcons.square_arrow_left),
                title: const Text('Cerrar sesión'),
              ),
              const SpaceY()
            ],
          ),
        ),
        const VerticalDivider(
          thickness: .25,
          width: 1,
        )
      ],
    );
  }
}
