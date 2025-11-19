// presentation/beneficiaries/beneficiaries_screen.dart
import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/beneficiary_tile.dart';
import '../widgets/chip_row.dart';
import '../widgets/section_box.dart';
import '../widgets/section_header.dart';

// Controller logic
class BeneficiariesController {
  static const List<String> displayOrder = [
    "Within Dukhan",
    "Within Qatar",
    "International",
    "Western Union",
  ];

  static const List<String> chipOrder = [
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
          .where((k) => data.containsKey(k))
          .map((k) => MapEntry(k, data[k]!))
          .toList();
    }
    final key = chipOrder[selected];
    return [MapEntry(key, data[key] ?? <Beneficiary>[])];
  }
}

class BeneficiariesScreen extends StatefulWidget {
  const BeneficiariesScreen({super.key});

  @override
  State<BeneficiariesScreen> createState() => _BeneficiariesScreenState();
}

class _BeneficiariesScreenState extends State<BeneficiariesScreen> {
  int selectedChipIndex = -1;
  bool showSearchBar = false;
  final TextEditingController searchController = TextEditingController();

  final List<String> chipLabels = BeneficiariesController.chipOrder;

  List<MapEntry<String, List<Beneficiary>>> getFilteredSections() {
    return BeneficiariesController.getSections(
      selectedChipIndex,
      beneficiariesStatic,
    );
  }

  void _onChipSelected(int index) {
    setState(() {
      selectedChipIndex = (selectedChipIndex == index) ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sections = getFilteredSections();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
          InkWell(
            onTap: () {
              setState(() {
                showSearchBar = !showSearchBar;
              });
            },
            child: CircleAvatar(
              radius: width * 0.035,
              backgroundColor: DefaultColors.grayF3,
              child: const Icon(Icons.search, color: Colors.black),
            ),
          ),
          SizedBox(width: width * 0.02),
          CircleAvatar(
            radius: width * 0.035,
            backgroundColor: DefaultColors.grayF3,
            child: const Icon(Icons.add, color: Colors.black),
          ),
          SizedBox(width: width * 0.03),
        ],
      ),
      body: Column(
        children: [
          if (showSearchBar)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: height * 0.055,
                decoration: BoxDecoration(
                  color: DefaultColors.grayF3,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: width * 0.02),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search...",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ChipRow(
              labels: chipLabels,
              selectedIndex: selectedChipIndex,
              onChipSelected: _onChipSelected,
            ),
          ),

          SizedBox(height: height * 0.02),

          Expanded(
            child: ListView.builder(
              itemCount: sections.length,
              itemBuilder: (context, i) {
                final entry = sections[i];
                final imagePath = _imageForSection(entry.key);

                return Padding(
                  padding: EdgeInsets.only(bottom: height * 0.025),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeader(
                        title: entry.key,
                        imagePath: imagePath,
                        onViewAll: () {},
                      ),
                      SizedBox(height: height * 0.015),
                      SectionBox(items: entry.value.cast<Beneficiary>()),
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

  String? _imageForSection(String key) {
    switch (key) {
      case 'Within Dukhan':
        return 'assets/images/dhukan.png';
      case 'Within Qatar':
        return 'assets/images/qatar.png';
      case 'International':
        return 'assets/images/globe.png';
      case 'Western Union':
        return 'assets/images/wu.png';
      default:
        return null;
    }
  }
}
