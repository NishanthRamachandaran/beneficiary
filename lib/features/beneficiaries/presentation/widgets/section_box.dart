// SECTION BOX (same shape as your old UI)
import 'package:beneficiary/features/beneficiaries/presentation/widgets/beneficiary_tile.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../domain/models/beneficiary.dart';

class SectionBox extends StatelessWidget {
  final List<Beneficiary> items;
  const SectionBox({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Container(
      width: w,
      decoration: BoxDecoration(
        color: DefaultColors.white,                        
        borderRadius: BorderRadius.circular(12),            
        border: Border.all(
          color: DefaultColors.blue_02.withOpacity(0.4),   
          width: 7,
        ),
      ),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            BeneficiaryTile(model: items[i]),

            // Divider with gap 
            if (i != items.length - 1)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                child: const Divider(
                  color: DefaultColors.grayE6,
                  thickness: 1,
                  height: 1,
                ),
              ),
          ]
        ],
      ),
    );
  }
}
