import 'package:flutter/material.dart';

class LogoToolbar extends StatelessWidget {
  final String? url;
  final double? height;

  const LogoToolbar({
    super.key,
    this.url,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Image(image: AssetImage(url ?? 'assets/brand/logo.webp'), height: height ?? kToolbarHeight),
        ),
      ],
    );
  }
}
