import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reportes_sia_stable/providers/providers.dart';
import 'package:reportes_sia_stable/widgets/space/space_widgets.dart';

class LoginFormView extends HookConsumerWidget {
  const LoginFormView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //THEME
    final globalTheme = Theme.of(context);

    //PROVIDERS
    final _loginProvider = ref.read(loginProvider.notifier);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/brand/logo_icon_mono.webp'),
                height: 75,
              ),
              const SpaceY(
                percent: 2,
              ),
              Text(
                'Iniciar sesión',
                textAlign: TextAlign.center,
                style: globalTheme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              const SpaceY(
                percent: 2,
              ),
              const TextField(
                decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.mail), hintText: 'Correo electronico'),
              ),
              const SpaceY(),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.lock),
                  hintText: 'Contraseña',
                ),
              ),
              const SpaceY(),
              FilledButton(onPressed: () => _loginProvider.login(), child: const Text('Iniciar sesión'))
            ],
          ),
        ),
      ),
    );
  }
}
