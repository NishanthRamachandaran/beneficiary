import 'package:flutter/material.dart';

import '../../colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    String path = "";
    if (title == "Within Dukhan") path = "assets/images/dhukan.png";
    if (title == "Within Qatar") path = "assets/images/qatar.png";
    if (title == "International") path = "assets/images/globe.png";
    if (title == "Western Union") path = "assets/images/wu.png";

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Image.asset(path, height: w * 0.05, width: w * 0.05),
          SizedBox(width: w * 0.02),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'DiodrumArabic',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: DefaultColors.black24,
            ),
          ),
        ]),
        Text(
          "View All",
          style: TextStyle(
            fontFamily: 'DiodrumArabic',
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: DefaultColors.blue9D,
          ),
        )
      ],
    );
  }
}
