import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../data/beneficiaries_static_data.dart';

/// STATE: which chip is selected
///
/// -1 → show all sections.
/// 0 → Western Union
/// 1 → International
/// 2 → Within Qatar
/// 3 → Within Dukhan
final selectedChipProvider = StateProvider<int>((ref) => -1);

/// Provides static data to UI.
final beneficiariesProvider = Provider((ref) => beneficiariesStaticData);
