import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final Color? backgroundColor;
  final IconData icon;

  const CustomCircleAvatar({Key? key, this.backgroundColor, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return CircleAvatar(
      backgroundColor: backgroundColor ?? appTheme.colorScheme.primary,
      child: Icon(icon, color: appTheme.colorScheme.onPrimary),
    );
  }
}
