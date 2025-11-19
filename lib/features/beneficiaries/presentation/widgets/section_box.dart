// presentation/beneficiaries/widgets/section_box.dart
import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import 'beneficiary_tile.dart';

// Static data
final Map<String, List<Beneficiary>> beneficiariesStatic = {
  "Within Dukhan": [
    const Beneficiary(
      name: "Yasmin Noor",
      id: "XXXX8817",
      bank: "Dukhan Bank (QA)",
    ),
    const Beneficiary(
      name: "Sara Rahman",
      id: "QRXXXXXXXXXXXXXX2029",
      bank: "Attijari Bank",
      localImage: "assets/images/sara.png",
    ),
    const Beneficiary(
      name: "Aliya Khan",
      id: "XXXX1827",
      bank: "Dukhan Bank (QA)",
    ),
  ],

  "Within Qatar": [
    const Beneficiary(
      name: "Sangita Raman",
      id: "XXXX8817",
      bank: "Attijari Bank",
    ),
    const Beneficiary(
      name: "Yasmin Noor",
      id: "XXXX8817",
      bank: "Dukhan Bank (QA)",
    ),
    const Beneficiary(
      name: "Rashidullah Khan",
      id: "XXXX8817",
      bank: "Dukhan Bank (QA)",
      localImage: "assets/images/rashid.png",
    ),
  ],

  "International": [
    const Beneficiary(
      name: "Yasmin Noor",
      id: "TN5905001000002730033209",
      bank: "Dukhan Bank (QA)",
    ),
    const Beneficiary(
      name: "Sara Rahman",
      id: "TN5905001000002730033209",
      bank: "Attijari Bank",
      localImage: "assets/images/sara.png",
    ),
    const Beneficiary(
      name: "Aliya Khan",
      id: "TN5905001000002730033209",
      bank: "Societe Tunisienne de Banque",
    ),
  ],

  "Western Union": [
    const Beneficiary(
      name: "Yasmin Noor",
      id: "Western Union (Cash)",
      bank: "United Kingdom",
    ),
    const Beneficiary(
      name: "Aliya Khan",
      id: "Western Union (Bank)",
      bank: "China",
    ),
    const Beneficiary(
      name: "Sara Rahman",
      id: "Western Union (Bank)",
      bank: "China",
      localImage: "assets/images/sara.png",
    ),
  ],
};

class SectionBox extends StatelessWidget {
  final List<Beneficiary> items;
  const SectionBox({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Container(
      width: w - 40,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      decoration: BoxDecoration(
        color: DefaultColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: DefaultColors.blue_100, width: 1.4),
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
          ],
        ],
      ),
    );
  }
}
