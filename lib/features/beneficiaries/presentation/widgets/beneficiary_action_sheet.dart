import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class BeneficiaryActionSheet {
  static void show(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: DefaultColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(height * 0.025),
        ),
      ),
      builder: (context) {
        return SafeArea(
          top: false,
          child: FractionallySizedBox(
            heightFactor: 0.6,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.02,
                  horizontal: width * 0.05,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// top pill
                    Center(
                      child: Container(
                        width: width * 0.12,
                        height: height * 0.006,
                        decoration: BoxDecoration(
                          color: DefaultColors.grayCA,
                          borderRadius:
                              BorderRadius.circular(height * 0.01),
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.03),

                    /// Title
                    Text(
                      "Select an action",
                      style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w700,
                        color: DefaultColors.black24,
                      ),
                    ),

                    SizedBox(height: height * 0.025),

                    _actionItem(
                      context,
                      Icons.swap_horiz,
                      "Transfer",
                      "Account within Dukhan bank",
                      () {},
                    ),
                    _divider(context),

                    _actionItem(
                      context,
                      Icons.repeat,
                      "Standing Order",
                      "Set up repeated payments",
                      () {},
                    ),
                    _divider(context),

                    _actionItem(
                      context,
                      Icons.edit,
                      "Edit",
                      "Update beneficiary details",
                      () {},
                    ),
                    _divider(context),

                    _actionItem(
                      context,
                      Icons.delete,
                      "Delete",
                      "Remove this beneficiary",
                      () {},
                    ),
                    _divider(context),

                    _actionItem(
                      context,
                      Icons.star_border,
                      "Favourite",
                      "Add as a favourite",
                      () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _actionItem(
    BuildContext context,
    IconData icon,
    String title,
    String sub,
    VoidCallback onTap,
  ) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.015),
        child: Row(
          children: [
            /// circular action icon
            Container(
              width: width * 0.1,
              height: width * 0.1,
              decoration: BoxDecoration(
                color: DefaultColors.blue_150_db.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: DefaultColors.blue_150_db,
                size: width * 0.05,
              ),
            ),

            SizedBox(width: width * 0.04),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w600,
                      color: DefaultColors.black,
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Text(
                    sub,
                    style: TextStyle(
                      fontSize: width * 0.033,
                      color: DefaultColors.gray71,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget _divider(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: 1,
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
      color: DefaultColors.grayE6,
    );
  }
}
