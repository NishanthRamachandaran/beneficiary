import 'package:beneficiary/features/transaction_popup/presentation/widgets/transaction_static_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/transaction_detail_popup.dart';

final transactionProvider = Provider<TransactionDetail>((ref) {
  return sampleTransaction; // reads static data
});
