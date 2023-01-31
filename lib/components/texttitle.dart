import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class TextTitle extends StatelessWidget {
  TextTitle({
    super.key,
    required this.text,
  });

  final String text;

  final double defaultSize = SizeConfig.defaultSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
      TextStyle(fontWeight: FontWeight.bold, fontSize: defaultSize * 1.6),
    );
  }
}