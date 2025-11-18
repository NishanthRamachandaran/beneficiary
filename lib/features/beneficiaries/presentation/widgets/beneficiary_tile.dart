import 'package:flutter/material.dart';
import '../../colors.dart';

class BeneficiaryTile extends StatelessWidget {
  final Map<String, dynamic> item;

  const BeneficiaryTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    ImageProvider? avatarImage;

    
    if (item["name"] == "Sara Rahman") {
      avatarImage = const AssetImage("assets/images/sara.png");
    }
    // If local image exists
    else if (item["localImage"] != null) {
      avatarImage = AssetImage(item["localImage"]);
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: w * 0.055,
            backgroundImage: avatarImage,
            backgroundColor: DefaultColors.grayF3,
            child: avatarImage == null
                ? Text(
                    item["name"].substring(0, 2).toUpperCase(),
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
                  item["name"],
                  style: const TextStyle(
                    fontFamily: 'DiodrumArabic',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: DefaultColors.black,
                  ),
                ),
                Text(
                  item["id"],
                  style: const TextStyle(
                    fontFamily: 'DiodrumArabic',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: DefaultColors.gray82,
                  ),
                ),
                Text(
                  item["bank"],
                  style: const TextStyle(
                    fontFamily: 'DiodrumArabic',
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: DefaultColors.gray82,
                  ),
                ),
              ],
            ),
          ),

          Icon(Icons.more_vert, size: w * 0.05, color: DefaultColors.gray71)
        ],
      ),
    );
  }
}
