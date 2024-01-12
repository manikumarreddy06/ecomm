import '../models/sizes_item_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';

// ignore: must_be_immutable
class SizesItemWidget extends StatelessWidget {
  SizesItemWidget(
    this.sizesItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SizesItemModel sizesItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 48.adaptSize,
          padding: EdgeInsets.symmetric(
            horizontal: 19.h,
            vertical: 13.v,
          ),
          decoration: AppDecoration.outlineBlue.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder24,
          ),
          child: Text(
            sizesItemModelObj.six!,
            style: theme.textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}
