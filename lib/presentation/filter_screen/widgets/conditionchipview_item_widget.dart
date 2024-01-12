import '../models/conditionchipview_item_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';

// ignore: must_be_immutable
class ConditionchipviewItemWidget extends StatelessWidget {
  ConditionchipviewItemWidget(
    this.conditionchipviewItemModelObj, {
    Key? key,
    this.onSelectedChipView,
  }) : super(
          key: key,
        );

  ConditionchipviewItemModel conditionchipviewItemModelObj;

  Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.all(16.h),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        conditionchipviewItemModelObj.newVar!,
        style: TextStyle(
          color: (conditionchipviewItemModelObj.isSelected ?? false)
              ? appTheme.blueGray300
              : theme.colorScheme.primary.withOpacity(1),
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: (conditionchipviewItemModelObj.isSelected ?? false),
      backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
      selectedColor: Colors.transparent,
      shape: (conditionchipviewItemModelObj.isSelected ?? false)
          ? RoundedRectangleBorder(
              side: BorderSide(
                color: appTheme.blue50,
                width: 1.h,
              ),
              borderRadius: BorderRadius.circular(
                5.h,
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                5.h,
              ),
            ),
      onSelected: (value) {
        onSelectedChipView?.call(value);
      },
    );
  }
}
