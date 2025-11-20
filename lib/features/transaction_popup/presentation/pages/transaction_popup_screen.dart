import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/transaction_detail_popup.dart';


final transactionProvider = Provider<TransactionDetail>((ref) {
  return TransactionDetail(
    amount: "+23,489.28 QAR",
    date: "23/11/2025, 23:07 PM",
    referenceNumber: "12345",
    beneficiaryName: "Sara Rahman",
    bankAndAccount: "Doha Bank\nIBAN QA55 1234 5678 9012 3456 7890",
    currency: "QAR",
    status: "Success",
    channel: "Mobile Banking",
    swiftReference: "SW123456789",
    description:
        'RIB: TFR to firstname LMOQP firstname LMOQP\n'
        'firstname LMOQP RIB RIB: TFR to firstname LMOQP\n'
        'firstname LMOQP RIB',
  );
});

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

      final tx = ref.read(transactionProvider);

      /// OPEN POPUP IMMEDIATELY
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
