import '../models/buyingformatchipview_item_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';

// ignore: must_be_immutable
class BuyingformatchipviewItemWidget extends StatelessWidget {
  BuyingformatchipviewItemWidget(
    this.buyingformatchipviewItemModelObj, {
    Key? key,
    this.onSelectedChipView,
  }) : super(
          key: key,
        );

  BuyingformatchipviewItemModel buyingformatchipviewItemModelObj;

  Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
      ),
      child: RawChip(
        padding: EdgeInsets.all(16.h),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          buyingformatchipviewItemModelObj.allListings!,
          style: TextStyle(
            color: (buyingformatchipviewItemModelObj.isSelected ?? false)
                ? theme.colorScheme.primary.withOpacity(1)
                : appTheme.blueGray300,
            fontSize: 12.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: (buyingformatchipviewItemModelObj.isSelected ?? false),
        backgroundColor: Colors.transparent,
        selectedColor: theme.colorScheme.primary.withOpacity(0.1),
        shape: (buyingformatchipviewItemModelObj.isSelected ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  5.h,
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide(
                  color: appTheme.blue50,
                  width: 1.h,
                ),
                borderRadius: BorderRadius.circular(
                  5.h,
                ),
              ),
        onSelected: (value) {
          onSelectedChipView?.call(value);
        },
      ),
    );
  }
}
