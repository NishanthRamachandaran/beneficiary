import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import 'package:beneficiary/features/transaction_popup/presentation/widgets/popup_row_item.dart';
import 'package:beneficiary/features/transaction_popup/presentation/widgets/popup_description.dart' ;
import '../popup_header_amount.dart';


class TransactionDetail {
  final String amount;
  final String date;
  final String referenceNumber;
  final String beneficiaryName;
  final String bankAndAccount;
  final String currency;
  final String status;
  final String channel;
  final String swiftReference;
  final String description;

  TransactionDetail({
    required this.amount,
    required this.date,
    required this.referenceNumber,
    required this.beneficiaryName,
    required this.bankAndAccount,
    required this.currency,
    required this.status,
    required this.channel,
    required this.swiftReference,
    required this.description,
  });
}

class TransactionDetailPopup extends StatelessWidget {
  final TransactionDetail transaction;

  const TransactionDetailPopup({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      backgroundColor: DefaultColors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: _PopupBody(transaction: transaction),
      ),
    );
  }
}

class _PopupBody extends StatelessWidget {
  final TransactionDetail transaction;

  const _PopupBody({required this.transaction});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return SizedBox(
      height: h * 0.82,
      child: Column(
        children: [
          PopupHeaderAmount(amount: transaction.amount),

          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                decoration: BoxDecoration(
                  border: Border.all(color: DefaultColors.grayE6),
                  borderRadius: BorderRadius.circular(12),
                  color: DefaultColors.white,
                ),
                child: Column(
                  children: [
                    PopupRowItem(label: "Date", value: transaction.date),
                    const Divider(height: 1, color: DefaultColors.blue_100),

                    PopupRowItem(
                        label: "Reference number",
                        value: transaction.referenceNumber),
                    const Divider(height: 1, color: DefaultColors.blue_100),

                    PopupRowItem(
                        label: "Beneficiary Name",
                        value: transaction.beneficiaryName),
                    const Divider(height: 1, color: DefaultColors.blue_100),

                    PopupRowItem(
                        label: "Bank Name / Account Number / IBAN",
                        value: transaction.bankAndAccount),
                    const Divider(height: 1, color: DefaultColors.blue_100),

                    PopupRowItem(
                        label: "Currency", value: transaction.currency),
                    const Divider(height: 1, color: DefaultColors.blue_100),
                    PopupRowItem(
                        label: "Status", value: transaction.status),
                    const Divider(height: 1, color: DefaultColors.blue_100),

                    PopupRowItem(
                        label: "Channel ID", value: transaction.channel),
                    const Divider(height: 1, color: DefaultColors.blue_100),
                    PopupRowItem(
                        label: "Swift / Transaction Reference",
                        value: transaction.swiftReference),
                    const Divider(height: 1, color: DefaultColors.blue_100),
                    PopupDescription(text: transaction.description),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
