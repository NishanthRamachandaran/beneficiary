import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../widgets/beneficiary_tile.dart';
import '../widgets/section_box.dart';

final beneficiariesProvider =
    Provider<Map<String, List<Beneficiary>>>((ref) => beneficiariesStatic);

final selectedChipProvider = StateProvider<int>((ref) => -1);
