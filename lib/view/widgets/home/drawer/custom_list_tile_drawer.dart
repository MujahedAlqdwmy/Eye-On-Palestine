import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class CustomListTileDrawer extends StatelessWidget {
  final Widget? leading;
  final String title;
  final Function()? onTap;
  const CustomListTileDrawer({
    super.key,
    required this.leading,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 15,
      minLeadingWidth: 0,
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColor.white,
          fontSize: 18,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        size: 15,
        color: AppColor.white,
      ),
    );
  }
}
