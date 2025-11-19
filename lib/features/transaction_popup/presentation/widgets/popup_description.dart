import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class PopupDescription extends StatelessWidget {
  final String text;

  const PopupDescription({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 4,
            child: Text(
              "Description",
              style: TextStyle(
                fontFamily: 'DiodrumArabic',
                fontSize: 13,
                color: DefaultColors.gray82,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontFamily: 'DiodrumArabic',
                fontSize: 13.5,
                fontWeight: FontWeight.w500,
                color: DefaultColors.black,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
