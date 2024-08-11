import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_colors.dart';

class CustomIconBottomBra extends StatelessWidget {
  final String textIcon;
  final String icon;
  final Function()? onTap;
  const CustomIconBottomBra({
    super.key,
    required this.textIcon,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 60,
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              width: 25,
              height: 25,
            ),
            const SizedBox(height: 5),
            Text(
              textIcon,
              style: const TextStyle(
                color: AppColor.textField,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
