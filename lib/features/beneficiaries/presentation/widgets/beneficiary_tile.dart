import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colors.dart';
import 'package:beneficiary/features/beneficiaries/domain/entities/beneficiary.dart';
import 'beneficiary_action_sheet.dart';

class BeneficiaryTile extends ConsumerStatefulWidget {
  final Beneficiary model;

  const BeneficiaryTile({super.key, required this.model});

  @override
  ConsumerState<BeneficiaryTile> createState() => _BeneficiaryTileState();
}

class _BeneficiaryTileState extends ConsumerState<BeneficiaryTile> {
  double _dragExtent = 0;
  final double _maxDragExtent = 120.0; // swipe distance limit

  void _handleDelete() {
    print('Delete ${widget.model.name}');
  }

  void _handleFavorite() {
    print('Favourite ${widget.model.name}');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          _dragExtent += details.delta.dx;

          if (_dragExtent > 0) _dragExtent = 0; // no right swipe
          if (_dragExtent < -_maxDragExtent) {
            _dragExtent = -_maxDragExtent; // limit
          }
        });
      },
      onHorizontalDragEnd: (_) {
        setState(() {
          if (_dragExtent < -_maxDragExtent / 2) {
            _dragExtent = -_maxDragExtent;
          } else {
            _dragExtent = 0;
          }
        });
      },
      child: Stack(
        children: [
          /// BACKGROUND ACTION ICONS
          Positioned.fill(
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Delete Button
                  GestureDetector(
                    onTap: () {
                      _handleDelete();
                      setState(() => _dragExtent = 0);
                    },
                    child: Container(
                      width: width * 0.12,
                      height: width * 0.12,
                      margin: EdgeInsets.only(right: width * 0.02),
                      decoration: BoxDecoration(
                        color: DefaultColors.redDB.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.delete_outline,
                        color: DefaultColors.redDB,
                        size: width * 0.06,
                      ),
                    ),
                  ),

                  // Star Button
                  GestureDetector(
                    onTap: () {
                      _handleFavorite();
                      setState(() => _dragExtent = 0);
                    },
                    child: Container(
                      width: width * 0.12,
                      height: width * 0.12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: DefaultColors.blue_150_db.withOpacity(0.12),
                      ),
                      child: Icon(
                        Icons.star_outline,
                        color: DefaultColors.blue_150_db,
                        size: width * 0.06,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// MAIN CONTENT TILE (UNTOUCHED ORIGINAL UI)
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            transform: Matrix4.translationValues(_dragExtent, 0, 0),
            child: Container(
              color: DefaultColors.white,
              padding: EdgeInsets.all(width * 0.04),
              child: Row(
                children: [
                  /// Avatar
                  CircleAvatar(
                    radius: width * 0.06,
                    backgroundColor: DefaultColors.grayF3,
                    backgroundImage: widget.model.localImage != null
                        ? AssetImage(widget.model.localImage!)
                        : (widget.model.avatarUrl != null
                            ? NetworkImage(widget.model.avatarUrl!)
                            : null),
                    child: (widget.model.localImage == null &&
                            widget.model.avatarUrl == null)
                        ? Text(
                            widget.model.name.substring(0, 2).toUpperCase(),
                            style: TextStyle(
                              fontFamily: 'DiodrumArabic',
                              fontWeight: FontWeight.w500,
                              fontSize: width * 0.035,
                              color: DefaultColors.black,
                            ),
                          )
                        : null,
                  ),

                  SizedBox(width: width * 0.03),

                  /// Name + ID + Bank
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.model.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'DiodrumArabic',
                            fontWeight: FontWeight.w500,
                            fontSize: width * 0.038,
                            color: DefaultColors.black,
                          ),
                        ),
                        SizedBox(height: height * 0.004),

                        Text(
                          widget.model.id,
                          style: TextStyle(
                            fontFamily: 'DiodrumArabic',
                            fontSize: width * 0.032,
                            color: DefaultColors.gray82,
                          ),
                        ),
                        SizedBox(height: height * 0.003),

                        Text(
                          widget.model.bank,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'DiodrumArabic',
                            fontSize: width * 0.03,
                            color: DefaultColors.gray82,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// More Icon
                  InkWell(
                    onTap: () => BeneficiaryActionSheet.show(context),
                    child: Icon(
                      Icons.more_vert,
                      size: width * 0.05,
                      color: DefaultColors.gray71,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
