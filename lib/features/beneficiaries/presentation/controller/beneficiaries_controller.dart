

/// ----------------
/// Controller decides which sections to show depending on
/// which chip the user selected.

class BeneficiariesController {
  static final displayOrder = [
    "Within Dukhan",
    "Within Qatar",
    "International",
    "Western Union",
  ];

  static final chipOrder = [
    "Western Union",
    "International",
    "Within Qatar",
    "Within Dukhan",
  ];

  /// Returns list of sections to display based on selected chip.
  ///
  /// selected == -1 → return all sections.
  /// else → return only the tapped section.
  static List<MapEntry<String, List<Map<String, dynamic>>>> getSections(
    int selected,
    Map<String, List<Map<String, dynamic>>> data,
  ) {
    if (selected == -1) {
      return displayOrder.map((e) => MapEntry(e, data[e]!)).toList();
    }

    final key = chipOrder[selected];
    return [MapEntry(key, data[key]!)];
  }
}
