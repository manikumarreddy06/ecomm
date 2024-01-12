import '../models/creditcard_item_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';

// ignore: must_be_immutable
class CreditcardItemWidget extends StatelessWidget {
  CreditcardItemWidget(
    this.creditcardItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CreditcardItemModel creditcardItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 21.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.fillPrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 7.v),
          CustomImageView(
            imagePath: ImageConstant.imgUser,
            height: 22.v,
            width: 36.h,
            margin: EdgeInsets.only(left: 3.h),
          ),
          SizedBox(height: 30.v),
          Text(
            "msg_6326_9124".tr,
            style: theme.textTheme.headlineSmall,
          ),
          SizedBox(height: 17.v),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.v),
                child: Column(
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        "lbl_card_holder".tr,
                        style: CustomTextStyles.bodySmallOnPrimaryContainer10,
                      ),
                    ),
                    SizedBox(height: 9.v),
                    Text(
                      "lbl_dominic_ovo".tr,
                      style: CustomTextStyles.labelMediumOnPrimaryContainer,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 37.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        "lbl_card_save".tr,
                        style: CustomTextStyles.bodySmallOnPrimaryContainer10,
                      ),
                    ),
                    SizedBox(height: 13.v),
                    Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Text(
                        "lbl_06_24".tr,
                        style: CustomTextStyles.labelMediumOnPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
