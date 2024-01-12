import '../models/categoriesgrid1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';
import 'package:momskart/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Categoriesgrid1ItemWidget extends StatelessWidget {
  Categoriesgrid1ItemWidget(
    this.categoriesgrid1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Categoriesgrid1ItemModel categoriesgrid1ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          height: 70.adaptSize,
          width: 70.adaptSize,
          padding: EdgeInsets.all(23.h),
          child: CustomImageView(
            imagePath: categoriesgrid1ItemModelObj?.womanTShirtIcon,
          ),
        ),
        SizedBox(height: 7.v),
        Text(
          categoriesgrid1ItemModelObj.tShirt!,
          style: CustomTextStyles.labelMediumBluegray300,
        ),
      ],
    );
  }
}
