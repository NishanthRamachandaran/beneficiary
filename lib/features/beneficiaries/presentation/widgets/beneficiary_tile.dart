import 'package:flutter/material.dart';
import '../../domain/models/beneficiary.dart';
import '../../colors.dart';

// Widget: single beneficiary row
// COMMAND: Presentational; accepts Beneficiary model only.
class BeneficiaryTile extends StatelessWidget {
  final Beneficiary model;
  const BeneficiaryTile({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width; 
    final ImageProvider? avatar = model.localImage != null
        ? AssetImage(model.localImage!)
        : (model.avatarUrl != null ? NetworkImage(model.avatarUrl!) : null);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: DefaultColors.grayF3,
            backgroundImage: avatar,
            child: avatar == null
                ? Text(
                    model.name.substring(0, 2).toUpperCase(),
                    style: const TextStyle(
                      fontFamily: 'DiodrumArabic',
                      fontWeight: FontWeight.w600,
                      color: DefaultColors.black,
                    ),
                  )
                : null,
          ),
          SizedBox(width: w * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: const TextStyle(
                    fontFamily: 'DiodrumArabic',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: DefaultColors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  model.id,
                  style: const TextStyle(
                    fontFamily: 'DiodrumArabic',
                    fontSize: 12,
                    color: DefaultColors.gray82,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  model.bank,
                  style: const TextStyle(
                    fontFamily: 'DiodrumArabic',
                    fontSize: 11,
                    color: DefaultColors.gray82,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.more_vert, color: DefaultColors.gray71, size: w * 0.05),
        ],
      ),
    );
  }
}
