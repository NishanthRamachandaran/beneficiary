import 'package:flutter/material.dart';

import '../../colors.dart';
import 'beneficiary_tile.dart';

class SectionBox extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const SectionBox({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Container(
      width: w,
      decoration: BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: DefaultColors.blueFF.withOpacity(0.4),
        ),
      ),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            BeneficiaryTile(item: items[i]),
            if (i != items.length - 1)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                child: Divider(color: DefaultColors.grayE6, thickness: 1),
              ),
          ]
        ],
      ),
    );
  }
}
