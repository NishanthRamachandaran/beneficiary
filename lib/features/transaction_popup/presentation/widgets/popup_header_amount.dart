import 'package:beneficiary/core/constants/colors.dart';
import 'package:flutter/material.dart';

class PopupHeaderAmount extends StatelessWidget {
  final String amount;

  const PopupHeaderAmount({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Amount",
            style: TextStyle(
              fontFamily: 'DiodrumArabic',
              color: DefaultColors.gray82,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              fontFamily: 'DiodrumArabic',
              color: DefaultColors.green54,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
