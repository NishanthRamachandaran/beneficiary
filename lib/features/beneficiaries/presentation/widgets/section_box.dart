// SECTION BOX (same shape as your old UI)

import 'package:flutter/material.dart';
import '../../colors.dart';
import '../../domain/models/beneficiary.dart';
import 'beneficiary_tile.dart';

class SectionBox extends StatelessWidget {
  final List<Beneficiary> items;
  const SectionBox({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Container(
      width: w - 10,                
      margin: const EdgeInsets.symmetric(horizontal: 5), 
      decoration: BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.circular(12),
        
      
        border: Border.all(
          color: DefaultColors.blue_100,
          width: 1.4, 
        ),
      ),

      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            
            BeneficiaryTile(model: items[i]),

            // Divider with left + right gap
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
