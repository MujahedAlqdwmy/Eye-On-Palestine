import 'package:flutter/material.dart';

import '../../../../core/constants/app_images.dart';

class HashemiteCard extends StatelessWidget {
  final String nameOfKing;
  const HashemiteCard({
    super.key,
    required this.nameOfKing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 100,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 35),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(
              0,
              2,
            ), // changes position of shadow
          ),
        ],
        image: const DecorationImage(
          image: AssetImage(
            AppImages.hashemiteCard,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        children: [
          Flexible(
            child: Text(
              nameOfKing,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.6,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
