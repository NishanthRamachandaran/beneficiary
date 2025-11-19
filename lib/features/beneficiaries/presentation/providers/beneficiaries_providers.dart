import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../data/beneficiaries_static_data.dart';
import '../../domain/models/beneficiary.dart';

// Provider: selected chip index. -1 means show ALL.
// COMMAND: UI widgets listen to this provider to react to chip taps.
final selectedChipProvider = StateProvider<int>((ref) => -1);

// Provider: static beneficiaries data as Map<String, List<Beneficiary>>

final beneficiariesStaticProvider = Provider<Map<String, List<Beneficiary>>>((ref) {
  return beneficiariesStatic;
});
