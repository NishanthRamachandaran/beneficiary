import 'package:flutter/material.dart';
import '../../colors.dart';

// Widget: section header with optional image on left and View All on right
//  Aligns to card width  padding.
class SectionHeader extends StatelessWidget {
  final String title;
  final String? imagePath;
  final VoidCallback? onViewAll;

  const SectionHeader({required this.title, this.imagePath, this.onViewAll, super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (imagePath != null) ...[
                Image.asset(imagePath!, height: w * 0.05, width: w * 0.05),
                const SizedBox(width: 8),
              ],
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'DiodrumArabic',
                  fontSize: 18, 
                  fontWeight: FontWeight.w600,
                  color: DefaultColors.black24,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: onViewAll,
            child: Text(
              'View All',
              style: const TextStyle(
                fontFamily: 'DiodrumArabic',
                fontSize: 13, 
                fontWeight: FontWeight.w600,
                color: DefaultColors.blue9D,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
