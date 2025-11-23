import 'package:beneficiary/features/beneficiaries/presentation/widgets/transaction_detail_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colors.dart';
import '../provider/transaction_provider.dart';

class Beneficiary {
  final String name;
  final String id;
  final String bank;
  final String? avatarUrl;
  final String? localImage;

  const Beneficiary({
    required this.name,
    required this.id,
    required this.bank,
    this.avatarUrl,
    this.localImage,
  });
}

class BeneficiaryTile extends ConsumerWidget {
  final Beneficiary model;

  const BeneficiaryTile({super.key, required this.model});

  void _openPopup(BuildContext context, WidgetRef ref) {
    final descriptionText =
        'RIB: TFR to firstname LMOQP firstname LMOQP\n'
        'firstname LMOQP RIB RIB: TFR to firstname LMOQP\n'
        'firstname LMOQP RIB';

    final tx = TransactionDetail(
      amount: "+23,489.28 QAR",
      date: "23/11/2025, 23:07 PM",
      referenceNumber: "ABCDE12345",
      beneficiaryName: model.name,
      bankAndAccount: "${model.bank}\n${model.id}",
      currency: "INR",
      status: "Success",
      channel: "Mobile Banking",
      swiftReference: "MS43978348",
      description: descriptionText,
    );

    // 1) Save selected transaction
    ref.read(transactionProvider.notifier).state = tx;

    // 2) Open popup
    showDialog(
      context: context,
      builder: (_) => TransactionDetailPopup(
        transaction: ref.read(transactionProvider.notifier).state!,
      ),
    ).then((_) {
      // 3) Reset provider value
      ref.read(transactionProvider.notifier).state = null;
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => _openPopup(context, ref),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: DefaultColors.grayF3,
              backgroundImage: model.localImage != null
                  ? AssetImage(model.localImage!)
                  : (model.avatarUrl != null
                      ? NetworkImage(model.avatarUrl!)
                      : null),
              child: (model.localImage == null && model.avatarUrl == null)
                  ? Text(
                      model.name.substring(0, 2).toUpperCase(),
                      style: const TextStyle(
                        fontFamily: 'DiodrumArabic',
                        fontWeight: FontWeight.w500,
                        color: DefaultColors.black,
                      ),
                    )
                  : null,
            ),

            SizedBox(width: width * 0.03),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: const TextStyle(
                      fontFamily: 'DiodrumArabic',
                      color: DefaultColors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    model.id,
                    style: const TextStyle(
                      fontFamily: 'DiodrumArabic',
                      color: DefaultColors.gray82,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    model.bank,
                    style: const TextStyle(
                      fontFamily: 'DiodrumArabic',
                      color: DefaultColors.gray82,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),

            InkWell(
              onTap: () => _openPopup(context, ref),
              child: Icon(
                Icons.more_vert,
                size: width * 0.05,
                color: DefaultColors.gray71,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
