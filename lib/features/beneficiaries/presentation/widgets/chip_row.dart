import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../colors.dart';
import '../providers/beneficiaries_providers.dart';

class ChipRow extends ConsumerWidget {
  final List<String> labels;

  const ChipRow({super.key, required this.labels});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedChipProvider);
    final w = MediaQuery.of(context).size.width;

    return SizedBox(
      height: w * 0.11,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(labels.length, (index) {
            final active = selected == index;

            return Container(
              margin: EdgeInsets.only(right: w * 0.03),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: active ? DefaultColors.blue_0 : DefaultColors.blueFA,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: active ? DefaultColors.blue9C : DefaultColors.grayE6,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  final current = ref.read(selectedChipProvider);
                  ref.read(selectedChipProvider.notifier).state =
                      current == index ? -1 : index;
                },
                child: Text(
                  labels[index],
                  style: TextStyle(
                    fontFamily: 'DiodrumArabic',
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: active ? Colors.black : DefaultColors.blue9D,
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
