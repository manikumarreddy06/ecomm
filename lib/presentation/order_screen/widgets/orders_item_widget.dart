import '../models/orders_item_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';

// ignore: must_be_immutable
class OrdersItemWidget extends StatelessWidget {
  OrdersItemWidget(
    this.ordersItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  OrdersItemModel ordersItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 4.v,
      ),
      decoration: AppDecoration.outlineBlue.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ordersItemModelObj.price!,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 3.v),
          Opacity(
            opacity: 0.5,
            child: Text(
              ordersItemModelObj.month!,
              style: CustomTextStyles.bodySmallOnPrimary_1,
            ),
          ),
          SizedBox(height: 38.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: 0.5,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 1.v),
                  child: Text(
                    ordersItemModelObj.orderStatus!,
                    style: CustomTextStyles.bodySmallOnPrimary_1,
                  ),
                ),
              ),
              Text(
                ordersItemModelObj.shipping!,
                style: CustomTextStyles.bodySmallOnPrimary,
              ),
            ],
          ),
          SizedBox(height: 9.v),
          Padding(
            padding: EdgeInsets.only(right: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 1.v),
                    child: Text(
                      ordersItemModelObj.items!,
                      style: CustomTextStyles.bodySmallOnPrimary_1,
                    ),
                  ),
                ),
                Text(
                  ordersItemModelObj.purchasedCount!,
                  style: CustomTextStyles.bodySmallOnPrimary,
                ),
              ],
            ),
          ),
          SizedBox(height: 9.v),
          Padding(
            padding: EdgeInsets.only(right: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    ordersItemModelObj.price1!,
                    style: CustomTextStyles.bodySmallOnPrimary_1,
                  ),
                ),
                Text(
                  ordersItemModelObj.price2!,
                  style: CustomTextStyles.labelLargePrimary,
                ),
              ],
            ),
          ),
          SizedBox(height: 1.v),
        ],
      ),
    );
  }
}
