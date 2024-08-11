import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class EventDetails extends StatelessWidget {
  final String date;
  final String content;
  final String imageUrl;
  final double areaOfPalestine;
  final double areaOfIsrael;

  const EventDetails({
    super.key,
    required this.date,
    required this.content,
    required this.imageUrl,
    required this.areaOfPalestine,
    required this.areaOfIsrael,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Divider(
          color: AppColor.white,
          thickness: 3,
        ),
        const SizedBox(height: 20),
        Text(
          date,
          style: const TextStyle(
            color: AppColor.textColorRed,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, progress) =>
                const CircularProgressIndicator(),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          content,
          style: const TextStyle(
            color: AppColor.textField,
            fontSize: 16,
            height: 1.6,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
