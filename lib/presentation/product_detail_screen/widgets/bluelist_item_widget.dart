import '../models/bluelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';

// ignore: must_be_immutable
class BluelistItemWidget extends StatelessWidget {
  BluelistItemWidget(
    this.bluelistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  BluelistItemModel bluelistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: CustomImageView(
          imagePath: ImageConstant.imgGroup475,
          height: 48.adaptSize,
          width: 48.adaptSize,
        ),
      ),
    );
  }
}
