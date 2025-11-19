import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/beneficiaries_providers.dart';
import '../../colors.dart';

// Widget: horizontal chips (filter bar)
// COMMAND: only UI - reads selectedChipProvider and updates it on tap.
class ChipRow extends ConsumerWidget {
  final List<String> labels;
  const ChipRow({required this.labels, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedChipProvider);
    final w = MediaQuery.of(context).size.width; // MEDIAQUERY usage (allowed)
    // COMMAND: use MediaQuery for size, but padding/radius/fonts are constants

    return SizedBox(
      height: w * 0.11, // responsive height using MediaQuery as required
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(labels.length, (index) {
            final isActive = selected == index;
            return Container(
              margin: EdgeInsets.only(right: w * 0.03),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8), // fixed padding constant style
              decoration: BoxDecoration(
                color: isActive ? DefaultColors.blue_0 : DefaultColors.blueFA,
                borderRadius: BorderRadius.circular(18), // radius constant-like (kept numeric)
                border: Border.all(
                  color: isActive ? DefaultColors.blue9C : DefaultColors.grayE6,
                ),
              ),
              child: InkWell(
                onTap: () {
                  final current = ref.read(selectedChipProvider);
                  ref.read(selectedChipProvider.notifier).state = (current == index) ? -1 : index;
                },
                child: Text(
                  labels[index],
                  style: TextStyle(
                    fontFamily: 'DiodrumArabic',
                    fontSize: 11, // fixed font size as requested
                    fontWeight: FontWeight.w600,
                    color: isActive ? Colors.black : DefaultColors.blue9D,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
