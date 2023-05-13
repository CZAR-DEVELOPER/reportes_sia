import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reportes_sia_stable/providers/providers.dart';

import 'package:reportes_sia_stable/widgets/widgets.dart';

class ExampleDestination {
  final String label;
  final Widget icon;

  ExampleDestination({
    required this.label,
    required this.icon,
  });
}

List<ExampleDestination> adminDestinations = <ExampleDestination>[
  ExampleDestination(label: 'Colaboradores', icon: const Icon(CupertinoIcons.building_2_fill)),
  ExampleDestination(label: 'Clientes', icon: const Icon(CupertinoIcons.person)),
  ExampleDestination(label: 'Depurador', icon: const Icon(CupertinoIcons.trash)),
];

class UserNavigationRailShared extends HookConsumerWidget {
  const UserNavigationRailShared({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //THEME
    final globalTheme = Theme.of(context);

    //PROVIDERS
    final _loginProvider = ref.read(loginProvider.notifier);

    return Row(
      children: [
        Container(
          color: Colors.white.withOpacity(.5),
          width: 304,
          child: Column(
            children: [
              const SpaceY(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Image(
                    image: AssetImage('assets/brand/logo.webp'),
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
                      style: globalTheme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Opacity(
                        opacity: .5,
                        child: Text(
                          'email@ejemplo.com',
                        )),
                    const SpaceY(),
                    Text(
                      'Administrador',
                      style: globalTheme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              for (var i = 0; i < adminDestinations.length; i++)
                ListTile(
                  onTap: () {},
                  selected: true,
                  leading: adminDestinations[i].icon,
                  title: Text(adminDestinations[i].label),
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
