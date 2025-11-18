import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../colors.dart';

import '../controller/beneficiaries_controller.dart';
import '../providers/beneficiaries_providers.dart';
import '../widgets/chip_row.dart';
import '../widgets/section_header.dart';
import '../widgets/section_box.dart';


class BeneficiariesScreen extends ConsumerWidget {
  const BeneficiariesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(beneficiariesProvider);
    final selected = ref.watch(selectedChipProvider);

    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    final sections =
        BeneficiariesController.getSections(selected, data);

    return Scaffold(
      backgroundColor: DefaultColors.whiteFD,

      appBar: AppBar(
        backgroundColor: DefaultColors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Beneficiaries",
          style: TextStyle(
            fontFamily: 'DiodrumArabic',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        actions: [
          CircleAvatar(
            radius: w * 0.035,
            backgroundColor: DefaultColors.grayF3,
            child: const Icon(Icons.search, color: Colors.black),
          ),
          SizedBox(width: w * 0.02),
          CircleAvatar(
            radius: w * 0.035,
            backgroundColor: DefaultColors.grayF3,
            child: const Icon(Icons.add, color: Colors.black),
          ),
          SizedBox(width: w * 0.03),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ChipRow(labels: BeneficiariesController.chipOrder),
            SizedBox(height: h * 0.02),

            Expanded(
              child: ListView(
                children: sections.map((entry) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: h * 0.025),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeader(title: entry.key),
                        SizedBox(height: h * 0.015),
                        SectionBox(items: entry.value),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
