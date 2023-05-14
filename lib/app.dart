import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';
import 'package:reportes_sia_stable/views/views.dart';

class ReportesSiaApp extends HookConsumerWidget {
  const ReportesSiaApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //THEME

    VisualDensity customVisualdensity =
        const VisualDensity(horizontal: 0, vertical: 0);
    Color customSeedColor = CupertinoColors.activeBlue;
    ColorScheme customColorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: customSeedColor,
      primary: customSeedColor,
      onPrimary: CupertinoColors.white,
    );

    return MaterialApp(
      builder: OneContext().builder,
      navigatorKey: OneContext().key,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: customColorScheme,
          fontFamily: 'Inter',
          dividerTheme: const DividerThemeData(thickness: .5, space: 1),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              foregroundColor: customColorScheme.onPrimary,
              backgroundColor: customColorScheme.primary),
          filledButtonTheme: FilledButtonThemeData(
              style:
                  FilledButton.styleFrom(visualDensity: customVisualdensity)),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(visualDensity: customVisualdensity)),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style:
                  OutlinedButton.styleFrom(visualDensity: customVisualdensity)),
          navigationRailTheme: NavigationRailThemeData(
              selectedIconTheme:
                  IconThemeData(color: customColorScheme.primary),
              unselectedLabelTextStyle: TextStyle(
                  fontSize: 14, color: customColorScheme.onBackground),
              selectedLabelTextStyle:
                  TextStyle(fontSize: 14, color: customColorScheme.primary)),
          dialogBackgroundColor: customColorScheme.background,
          dialogTheme: DialogTheme(
              surfaceTintColor: Colors.transparent,
              backgroundColor: customColorScheme.background),
          searchBarTheme: SearchBarThemeData(
            surfaceTintColor:
                const MaterialStatePropertyAll(Colors.transparent),
            padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
            shadowColor: const MaterialStatePropertyAll(Colors.transparent),
            backgroundColor: MaterialStatePropertyAll(
                customColorScheme.surfaceVariant.withOpacity(.75)),
            side: const MaterialStatePropertyAll(BorderSide.none),
            constraints: BoxConstraints.tight(const Size(64, 48)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
          ),
          appBarTheme: AppBarTheme(
              foregroundColor: customColorScheme.onBackground,
              backgroundColor: customColorScheme.background,
              scrolledUnderElevation: 0),
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8)),
              filled: true,
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              fillColor: customColorScheme.surfaceVariant.withOpacity(.25))),
      initialRoute: '/login',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/login': (context) => const LoginFormView(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/admin': (context) => const AdminView(),
      },
    );
  }
}
