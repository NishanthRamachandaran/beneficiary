// presentation/beneficiaries/widgets/chip_row.dart
import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

// Provider state management
class ChipState {
  static int selectedChipIndex = -1;
}

// Widget: horizontal chips (filter bar)
class ChipRow extends StatefulWidget {
  final List<String> labels;
  final Function(int) onChipSelected;
  final int selectedIndex;

  const ChipRow({
    required this.labels,
    required this.selectedIndex,
    required this.onChipSelected,
    super.key,
  });

  @override
  State<ChipRow> createState() => _ChipRowState();
}

class _ChipRowState extends State<ChipRow> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return SizedBox(
      height: w * 0.11,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(widget.labels.length, (index) {
            final isActive = widget.selectedIndex == index;
            return Container(
              margin: EdgeInsets.only(right: w * 0.03),
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ), 
              decoration: BoxDecoration(
                color: isActive ? DefaultColors.blue_0 : DefaultColors.blueFA,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: isActive ? DefaultColors.blue9C : DefaultColors.grayE6,
                ),
              ),
              child: InkWell(
                onTap: () {
                  widget.onChipSelected(index);
                },
                child: Text(
                  widget.labels[index],
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