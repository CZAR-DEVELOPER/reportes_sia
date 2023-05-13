import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reportes_sia_stable/widgets/space/space_widgets.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(
              image: AssetImage('assets/brand/logo.webp'),
              height: 150,
            ),
            const SpaceY(),
            const Text(
              'Selecciona tu tipo de ingreso',
              textAlign: TextAlign.center,
            ),
            const SpaceY(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserTypeButton(onPressed: () {}, icon: CupertinoIcons.building_2_fill, label: 'Colaborador'),
                const SpaceX(),
                UserTypeButton(onPressed: () {}, icon: CupertinoIcons.person, label: 'Cliente'),
                const SpaceX(),
                UserTypeButton(onPressed: () {}, icon: CupertinoIcons.checkmark_seal, label: 'Administrador'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class UserTypeButton extends StatelessWidget {
  final Function()? onPressed;
  final IconData icon;
  final String label;

  const UserTypeButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    //THEME
    final globalTheme = Theme.of(context);

    return Column(
      children: [
        IconButton.filledTonal(
            onPressed: onPressed,
            icon: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                icon,
                size: globalTheme.textTheme.headlineLarge!.fontSize,
              ),
            )),
        const SpaceY(
          percent: .5,
        ),
        Text(label)
      ],
    );
  }
}
