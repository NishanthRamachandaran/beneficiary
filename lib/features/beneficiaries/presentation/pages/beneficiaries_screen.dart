// presentation/beneficiaries/beneficiaries_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/colors.dart';
import '../provider/beneficiary_provider.dart';
import '../widgets/chip_row.dart';
import '../widgets/section_box.dart';
import '../widgets/section_header.dart';
import '../widgets/beneficiary_tile.dart';

class BeneficiariesScreen extends ConsumerWidget {
  const BeneficiariesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(beneficiariesProvider);
    final selectedChip = ref.watch(selectedChipProvider);

    // Compute active sections
    final sections = BeneficiariesController.getSections(selectedChip, data);

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: DefaultColors.whiteFD,
      appBar: AppBar(
        backgroundColor: DefaultColors.white,
        elevation: 0,
        title: const Text(
          "Beneficiaries",
          style: TextStyle(
            fontFamily: 'DiodrumArabic',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ChipRow(labels: BeneficiariesController.chipOrder),
          ),

          SizedBox(height: height * 0.02),

          Expanded(
            child: ListView.builder(
              itemCount: sections.length,
              itemBuilder: (context, index) {
                final entry = sections[index];

                return Padding(
                  padding: EdgeInsets.only(bottom: height * 0.025),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeader(
                        title: entry.key,
                        imagePath: _imageFor(entry.key),
                        onViewAll: () {},
                      ),

                      SizedBox(height: height * 0.015),

                      SectionBox(items: entry.value),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String? _imageFor(String key) {
    switch (key) {
      case "Within Dukhan":
        return "assets/images/dhukan.png";
      case "Within Qatar":
        return "assets/images/qatar.png";
      case "International":
        return "assets/images/globe.png";
      case "Western Union":
        return "assets/images/wu.png";
    }
    return null;
  }
}

class BeneficiariesController {
  static const displayOrder = [
    "Within Dukhan",
    "Within Qatar",
    "International",
    "Western Union",
  ];

  static const chipOrder = [
    "Western Union",
    "International",
    "Within Qatar",
    "Within Dukhan",
  ];

  static List<MapEntry<String, List<Beneficiary>>> getSections(
    int selected,
    Map<String, List<Beneficiary>> data,
  ) {
    if (selected == -1) {
      return displayOrder
          .map((label) => MapEntry(label, data[label] ?? []))
          .toList();
    }

    final key = chipOrder[selected];
    return [MapEntry(key, data[key] ?? [])];
  }
}
