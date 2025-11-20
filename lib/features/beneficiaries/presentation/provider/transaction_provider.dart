import '../widgets/transaction_detail_popup.dart';
import 'package:flutter_riverpod/legacy.dart';

final transactionProvider = StateProvider<TransactionDetail?>(
  (ref) => null,
);
