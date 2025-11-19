// Controller: contains pure logic (no Flutter widgets here)
// COMMAND: This controller decides which sections to show given selected chip index.

class BeneficiariesController {
  // COMMAND: displayOrder defines the order in which sections render when "All" is selected.
  static const List<String> displayOrder = [
    "Within Dukhan",
    "Within Qatar",
    "International",
    "Western Union",
  ];

  // COMMAND: chipOrder defines the order of chips (filter bar) — intentionally different from displayOrder.
  static const List<String> chipOrder = [
    "Western Union",
    "International",
    "Within Qatar",
    "Within Dukhan",
  ];

  // COMMAND: getSections returns a list of MapEntry(sectionTitle -> listOfItems)
  //  - selected == -1 -> return all sections.
  //  - else -> return only the tapped section.
  static List<MapEntry<String, List<T>>> getSections<T>(
    int selected,
    Map<String, List<T>> data,
  ) {
    if (selected == -1) {
      return displayOrder
          .where((k) => data.containsKey(k))
          .map((k) => MapEntry(k, data[k]!))
          .toList();
    }
    final key = chipOrder[selected];
    return [MapEntry(key, data[key] ?? <T>[])];
  }
}
