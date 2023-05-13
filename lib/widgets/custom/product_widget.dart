import 'package:flutter/material.dart';

class ProductIcon extends StatelessWidget {
  const ProductIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.grey.withOpacity(.25),
    );
  }
}
