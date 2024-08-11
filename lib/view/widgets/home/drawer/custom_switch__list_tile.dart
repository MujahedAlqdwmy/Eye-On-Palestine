import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomeSwitchListTile extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final void Function(bool)? onChangedSwitch;
  final bool switchvalue;
  const CustomeSwitchListTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.onChangedSwitch,
    required this.switchvalue,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 15,
      minLeadingWidth: 0,
      leading: const Icon(
        Icons.dark_mode,
        color: AppColor.gold,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColor.white,
          fontSize: 18,
        ),
      ),
      trailing: Switch(
        value: switchvalue,
        onChanged: onChangedSwitch,
        activeColor: AppColor.white,
        activeTrackColor: AppColor.grayDark,
        inactiveTrackColor: AppColor.white,
        inactiveThumbColor: AppColor.grayDark,
      ),
    );
  }
}
