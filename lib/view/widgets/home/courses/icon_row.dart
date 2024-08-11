import 'package:flutter/material.dart';

class IconRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;
  final Color? color;
  const IconRow({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Icon(
            icon,
            size: 20,
            color: color,
          ),
        ),
        const SizedBox(width: 5),
        Text(text)
      ],
    );
  }
}
