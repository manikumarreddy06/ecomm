import '../models/arrowright_item_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';
import 'package:momskart/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ArrowrightItemWidget extends StatelessWidget {
  ArrowrightItemWidget(
    this.arrowrightItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ArrowrightItemModel arrowrightItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 1.v),
        child: Column(
          children: [
            CustomIconButton(
              height: 70.adaptSize,
              width: 70.adaptSize,
              padding: EdgeInsets.all(23.h),
              child: CustomImageView(
                imagePath: arrowrightItemModelObj?.arrowRight,
              ),
            ),
            SizedBox(height: 7.v),
            Text(
              arrowrightItemModelObj.manShirt!,
              style: CustomTextStyles.bodySmall10,
            ),
          ],
        ),
      ),
    );
  }
}
