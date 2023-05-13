import '../space/space_widgets.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class EmptyListTile extends StatelessWidget {
  const EmptyListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.message,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            Icon(
              icon,
              size: Theme.of(context).textTheme.headlineLarge!.fontSize,
            ),
            const SpaceY(),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SpaceY(
              percent: .5,
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
