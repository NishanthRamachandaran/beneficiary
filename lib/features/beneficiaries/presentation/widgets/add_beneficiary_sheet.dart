import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class AddBeneficiarySheet {
  static void show(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: DefaultColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(width * 0.06),
        ),
      ),
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.02,
              horizontal: width * 0.05,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Drag Handle
                Container(
                  width: width * 0.15,
                  height: height * 0.006,
                  decoration: BoxDecoration(
                    color: DefaultColors.grayCA,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                SizedBox(height: height * 0.02),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "New beneficiary",
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w700,
                      color: DefaultColors.black,
                      fontFamily: "DiodrumArabic",
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.005),
                    child: Text(
                      "Choose the account you’d like to transfer from",
                      style: TextStyle(
                        fontSize: width * 0.033,
                        color: DefaultColors.gray71,
                        fontFamily: "DiodrumArabic",
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.025),

                /// Beneficiary Options
                _optionTile(
                  context,
                  title: "Within Dukhan",
                  asset: "assets/images/dhukan.png",
                ),
                _divider(),

                ///  Within Dukhan + Tahweel TRAILING LOGO
                _optionTile(
                  context,
                  title: "Within Dukhan",
                  asset: "assets/images/qatar.png",
                  trailing: Image.asset(
                    "assets/images/tahweel.png",
                    width: width * 0.20,
                    height: width * 0.08,
                    fit: BoxFit.contain,
                    errorBuilder: (context, _, __) => const SizedBox(),
                  ),
                ),
                _divider(),

                _optionTile(
                  context,
                  title: "Fawran",
                  asset: "assets/images/fawran.png",
                ),
                _divider(),

                _optionTile(
                  context,
                  title: "International Transfer",
                  asset: "assets/images/globe.png",
                ),
                _divider(),

                _optionTile(
                  context,
                  title: "Western Union",
                  asset: "assets/images/wu.png",
                ),

                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Option List Tile
  static Widget _optionTile(
    BuildContext context, {
    required String title,
    required String asset,
    IconData? icon,
    Widget? trailing,
  }) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: width * 0.035),
        child: Row(
          children: [
            CircleAvatar(
              radius: width * 0.055,
              backgroundColor: DefaultColors.grayF3,
              child: icon != null
                  ? Icon(icon, color: DefaultColors.blue_150_db)
                  : Padding(
                      padding: EdgeInsets.all(width * 0.01),
                      child: Image.asset(
                        asset,
                        width: width * 0.07,
                        height: width * 0.07,
                        fit: BoxFit.contain,
                      ),
                    ),
            ),
            SizedBox(width: width * 0.04),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: width * 0.04,
                  color: DefaultColors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: "DiodrumArabic",
                ),
              ),
            ),

            ///  trailing widget for Tahweel
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }

  static Widget _divider() {
    return Container(
      height: 1,
      color: DefaultColors.grayE6,
    );
  }
}
