import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/beneficiary.dart';
import '../controller/beneficiaries_controller.dart';
import '../widgets/chip_row.dart';
import '../widgets/section_header.dart';
import '../widgets/section_box.dart';
import '../providers/beneficiaries_providers.dart';
import '../../colors.dart';

//  Page builds UI and connects provider + controller logic.
class BeneficiariesScreen extends ConsumerStatefulWidget {
  const BeneficiariesScreen({super.key});

  @override
  ConsumerState<BeneficiariesScreen> createState() => _BeneficiariesScreenState();
}

class _BeneficiariesScreenState extends ConsumerState<BeneficiariesScreen> {
  
  bool showSearchBar = false; //toggles basic search bar visibility
  final TextEditingController searchController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(beneficiariesStaticProvider);
    final selected = ref.watch(selectedChipProvider);

    // COMMAND: controller decides which section list to show
    final sections = BeneficiariesController.getSections(selected, data);

    final chipsOrder = BeneficiariesController.chipOrder;

    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

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
          // ---------------- SEARCH ICON ----------------
          InkWell(
            onTap: () {
              setState(() {
                showSearchBar = !showSearchBar; // toggle search bar
              });
            },
            child: CircleAvatar(
              radius: w * 0.035,
              backgroundColor: DefaultColors.grayF3,
              child: const Icon(Icons.search, color: Colors.black),
            ),
          ),
          SizedBox(width: w * 0.02),

          // ---------------- ADD ICON ----------------
          CircleAvatar(
            radius: w * 0.035,
            backgroundColor: DefaultColors.grayF3,
            child: const Icon(Icons.add, color: Colors.black),
          ),
          SizedBox(width: w * 0.03),
        ],
      ),

      body: Column(
        children: [

          // ---------------- SIMPLE SEARCH BAR (NO FUNCTIONALITY) ----------------
          if (showSearchBar)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: h * 0.055,
                decoration: BoxDecoration(
                  color: DefaultColors.grayF3,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: w * 0.02),
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

          // ---------------- CHIP ROW ----------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ChipRow(labels: chipsOrder),
          ),

          SizedBox(height: h * 0.02),

          // ---------------- SECTION LIST ----------------
          Expanded(
            child: ListView.builder(
              itemCount: sections.length,
              itemBuilder: (context, i) {
                final entry = sections[i];
                final imagePath = _imageForSection(entry.key);

                return Padding(
                  padding: EdgeInsets.only(bottom: h * 0.025),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionHeader(
                        title: entry.key,
                        imagePath: imagePath,
                        onViewAll: () {},
                      ),
                      SizedBox(height: h * 0.015),
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

  // Helper
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
