import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class PopupRowItem extends StatelessWidget {
  final String label;
  final String value;

  const PopupRowItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: const TextStyle(
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
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontFamily: 'DiodrumArabic',
                fontSize: 13.5,
                color: DefaultColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
