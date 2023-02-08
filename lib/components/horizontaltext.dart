import 'package:flutter/material.dart';

class HorizontalTextLine extends StatelessWidget {
  const HorizontalTextLine({Key? key, required this.height, required this.label}) : super(key: key);
  final String label;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(
          padding: const EdgeInsets.only(right: 10),
          child: Divider(
            color: Colors.black,height: height,
          ),
        )),
        Text(label),
        Expanded(child: Container(
          padding: const EdgeInsets.only(left: 10),
          child: Divider(
            color: Colors.black,height: height,
          ),
        )),
      ],
    );
  }
}
