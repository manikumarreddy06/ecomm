import '../models/addresses_item_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';

// ignore: must_be_immutable
class AddressesItemWidget extends StatelessWidget {
  AddressesItemWidget(
    this.addressesItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  AddressesItemModel addressesItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 23.h,
        vertical: 21.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            addressesItemModelObj.priscekila!,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 19.v),
          Container(
            width: 264.h,
            margin: EdgeInsets.only(right: 30.h),
            child: Text(
              addressesItemModelObj.address!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall!.copyWith(
                height: 1.80,
              ),
            ),
          ),
          SizedBox(height: 14.v),
          Text(
            addressesItemModelObj.mobileNo!,
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 19.v),
          Row(
            children: [
              Text(
                addressesItemModelObj.edit!,
                style: CustomTextStyles.titleSmallPrimary,
              ),
              Padding(
                padding: EdgeInsets.only(left: 32.h),
                child: Text(
                  addressesItemModelObj.delete!,
                  style: CustomTextStyles.titleSmallPink300,
                ),
              ),
            ],
          ),
          SizedBox(height: 3.v),
        ],
      ),
    );
  }
}
