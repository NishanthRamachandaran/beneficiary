import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/colors.dart';
import '../provider/beneficiary_provider.dart';
import '../widgets/add_beneficiary_sheet.dart';
import '../widgets/chip_row.dart';
import '../widgets/section_box.dart';
import '../widgets/section_header.dart';
import 'package:beneficiary/features/beneficiaries/domain/entities/beneficiary.dart';

class BeneficiariesScreen extends ConsumerWidget {
  const BeneficiariesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(beneficiariesProvider);
    final selectedChip = ref.watch(selectedChipProvider);

    final sections = BeneficiariesController.getSections(selectedChip, data);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: DefaultColors.whiteFD,

      // UPDATED APPBAR WITH SEARCH, PLUS, BACK ICON
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0044A8),
                Color(0xFF00A3FF),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SafeArea(
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(width: 8),

                const Text(
                  "Beneficiaries",
                  style: TextStyle(
                    fontFamily: 'DiodrumArabic',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),

                const Spacer(),

               _circleIcon(Icons.search, () {
  //AddBeneficiarySheet.show(context); // Call bottom sheet here
}),

                const SizedBox(width: 10),

                _circleIcon(Icons.add, () {
                  AddBeneficiarySheet.show(context); 
                  // TODO: add action here
                }),
              ],
            ),
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

  // Circle icon widget for Search / Add
  static Widget _circleIcon(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.7), width: 1),
        ),
        child: Icon(icon, size: 18, color: Colors.white),
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
