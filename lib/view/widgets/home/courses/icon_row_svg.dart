import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconRowSvg extends StatelessWidget {
  final String text;
  final String icon;
  const IconRowSvg({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        const SizedBox(width: 10),
        Text(text),
      ],
    );
  }
}
