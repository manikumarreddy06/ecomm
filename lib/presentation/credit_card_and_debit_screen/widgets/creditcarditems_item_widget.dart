import '../models/creditcarditems_item_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';

// ignore: must_be_immutable
class CreditcarditemsItemWidget extends StatelessWidget {
  CreditcarditemsItemWidget(
    this.creditcarditemsItemModelObj, {
    Key? key,
    this.onTapCreditCardItem,
  }) : super(
          key: key,
        );

  CreditcarditemsItemModel creditcarditemsItemModelObj;

  VoidCallback? onTapCreditCardItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCreditCardItem!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 21.h,
          vertical: 24.v,
        ),
        decoration: AppDecoration.fillPrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgUser,
              height: 22.v,
              width: 36.h,
              margin: EdgeInsets.only(left: 3.h),
            ),
            SizedBox(height: 30.v),
            Text(
              creditcarditemsItemModelObj.debitCardNumber!,
              style: theme.textTheme.headlineSmall,
            ),
            SizedBox(height: 17.v),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.v),
                  child: Column(
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Text(
                          creditcarditemsItemModelObj.cardholder!,
                          style: CustomTextStyles.bodySmallOnPrimaryContainer10,
                        ),
                      ),
                      SizedBox(height: 3.v),
                      Text(
                        creditcarditemsItemModelObj.dominicOvo!,
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
                          creditcarditemsItemModelObj.cardsave!,
                          style: CustomTextStyles.bodySmallOnPrimaryContainer10,
                        ),
                      ),
                      SizedBox(height: 3.v),
                      Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: Text(
                          creditcarditemsItemModelObj.debitCardExpiry!,
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
      ),
    );
  }
}
