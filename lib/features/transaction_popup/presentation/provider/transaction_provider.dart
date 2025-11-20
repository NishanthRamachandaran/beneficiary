
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../widgets/transaction_detail_popup.dart';

final transactionProvider = StateProvider<TransactionDetail?>(
  (ref) => null,
);
