import '../models/categoriesgrid_item_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';
import 'package:momskart/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class CategoriesgridItemWidget extends StatelessWidget {
  CategoriesgridItemWidget(
    this.categoriesgridItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  CategoriesgridItemModel categoriesgridItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          height: 70.adaptSize,
          width: 70.adaptSize,
          padding: EdgeInsets.all(23.h),
          child: CustomImageView(
            imagePath: categoriesgridItemModelObj?.manWorkEquipment,
          ),
        ),
        SizedBox(height: 8.v),
        Text(
          categoriesgridItemModelObj.officeBag!,
          style: CustomTextStyles.labelMediumBluegray300,
        ),
      ],
    );
  }
}
