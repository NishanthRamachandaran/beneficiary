// lib/features/transaction_popup/presentation/transaction_popup_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/transaction_provider.dart';
import '../widgets/transaction_detail_popup.dart';
import '../../../../core/constants/colors.dart';

class TransactionPopupScreen extends ConsumerStatefulWidget {
  const TransactionPopupScreen({super.key});

  @override
  ConsumerState<TransactionPopupScreen> createState() =>
      _TransactionPopupScreenState();
}

class _TransactionPopupScreenState
    extends ConsumerState<TransactionPopupScreen> {
  bool shown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!shown) {
      shown = true;

      /// provider data
      final tx = ref.read(transactionProvider);

      /// Prevent null crash
      if (tx == null) return;

      Future.microtask(() {
        showDialog(
          context: context,
          builder: (_) => TransactionDetailPopup(transaction: tx),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: DefaultColors.whiteFD,
      body: SizedBox.shrink(),
    );
  }
}
