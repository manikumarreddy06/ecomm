import '../models/favoriteproduct_item_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';
import 'package:momskart/widgets/custom_rating_bar.dart';

// ignore: must_be_immutable
class FavoriteproductItemWidget extends StatelessWidget {
  FavoriteproductItemWidget(
    this.favoriteproductItemModelObj, {
    Key? key,
    this.onTapProductItem,
  }) : super(
          key: key,
        );

  FavoriteproductItemModel favoriteproductItemModelObj;

  VoidCallback? onTapProductItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapProductItem!.call();
      },
      child: Container(
        padding: EdgeInsets.all(15.h),
        decoration: AppDecoration.outlineBlue.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: favoriteproductItemModelObj?.image,
              height: 133.adaptSize,
              width: 133.adaptSize,
              radius: BorderRadius.circular(
                5.h,
              ),
            ),
            SizedBox(height: 8.v),
            SizedBox(
              width: 107.h,
              child: Text(
                favoriteproductItemModelObj.nikeAirMaxReact!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelLarge!.copyWith(
                  height: 1.50,
                ),
              ),
            ),
            SizedBox(height: 4.v),
            CustomRatingBar(
              ignoreGestures: true,
              initialRating: 4,
            ),
            SizedBox(height: 18.v),
            Text(
              favoriteproductItemModelObj.price!,
              style: CustomTextStyles.labelLargePrimary,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 9.v),
                  child: Text(
                    favoriteproductItemModelObj.price1!,
                    style: CustomTextStyles.bodySmall10.copyWith(
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.h,
                    top: 9.v,
                  ),
                  child: Text(
                    favoriteproductItemModelObj.offer!,
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgTrashIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(left: 17.h),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
