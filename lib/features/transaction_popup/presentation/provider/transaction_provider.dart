import 'package:beneficiary/features/transaction_popup/presentation/widgets/transaction_static_data.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../widgets/transaction_detail_popup.dart';

final transactionProvider = StateProvider<TransactionDetail?>((ref) => sampleTransaction);
