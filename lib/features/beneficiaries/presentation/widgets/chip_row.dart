import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colors.dart';
import '../provider/beneficiary_provider.dart';

class ChipRow extends ConsumerWidget {
  final List<String> labels;

  const ChipRow({required this.labels, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChipIndex = ref.watch(selectedChipProvider);
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: width * 0.11,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(labels.length, (index) {
            final isActive = selectedChipIndex == index;

            return Container(
              margin: EdgeInsets.only(right: width * 0.03),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isActive ? DefaultColors.blue_0 : DefaultColors.blueFA,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: isActive ? DefaultColors.blue9C : DefaultColors.grayE6,
                ),
              ),
              child: InkWell(
                onTap: () {
                  ref.read(selectedChipProvider.notifier).state =
                      isActive ? -1 : index;
                },
                child: Text(
                  labels[index],
                  style: TextStyle(
                    fontFamily: 'DiodrumArabic',
                    fontSize: 11,
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
