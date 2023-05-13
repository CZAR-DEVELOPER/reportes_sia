import 'package:flutter/material.dart';

class SpaceX extends StatelessWidget {
  final double? percent;
  const SpaceX({Key? key, this.percent = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16 * percent!,
    );
  }
}

class SpaceY extends StatelessWidget {
  final double? percent;
  const SpaceY({Key? key, this.percent = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16 * percent!,
    );
  }
}

class SpaceXY extends StatelessWidget {
  final double? percent;
  const SpaceXY({Key? key, this.percent = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16 * percent!,
      height: 16 * percent!,
    );
  }
}

class ColumnPadding extends StatelessWidget {
  final bool? horizontal;
  final bool? vertical;
  final List<Widget> children;

  const ColumnPadding({Key? key, this.horizontal = true, this.vertical = false, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal == true ? 16 : 0, vertical: vertical == true ? 16 : 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
