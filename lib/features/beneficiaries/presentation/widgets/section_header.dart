import 'package:flutter/material.dart';
import '../../colors.dart';

// Widget: section header with optional image on left and View All on right
// COMMAND: purely presentational. Aligns to card width via parent padding.
class SectionHeader extends StatelessWidget {
  final String title;
  final String? imagePath;
  final VoidCallback? onViewAll;

  const SectionHeader({required this.title, this.imagePath, this.onViewAll, super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width; // allowed
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.01), // uses MediaQuery for alignment
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
                  fontSize: 18, // fixed font size per rule
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
                fontSize: 13, // fixed
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
