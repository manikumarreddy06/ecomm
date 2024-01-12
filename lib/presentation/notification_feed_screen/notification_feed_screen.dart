import 'bloc/notification_feed_bloc.dart';
import 'models/notification_feed_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';
import 'package:momskart/widgets/app_bar/appbar_leading_image.dart';
import 'package:momskart/widgets/app_bar/appbar_subtitle.dart';
import 'package:momskart/widgets/app_bar/custom_app_bar.dart';

class NotificationFeedScreen extends StatelessWidget {
  const NotificationFeedScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationFeedBloc>(
        create: (context) => NotificationFeedBloc(NotificationFeedState(
            notificationFeedModelObj: NotificationFeedModel()))
          ..add(NotificationFeedInitialEvent()),
        child: NotificationFeedScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationFeedBloc, NotificationFeedState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 11.v),
                  child: Column(children: [
                    _buildFeedItemRow(context,
                        productImage: ImageConstant.imgProductImage,
                        bestProductText: "lbl_new_product".tr,
                        productDescription: "msg_nike_air_zoom_pegasus2".tr,
                        dateText: "msg_june_3_2015_5_06".tr),
                    _buildFeedItemRow(context,
                        productImage: ImageConstant.imgImageProduct,
                        bestProductText: "lbl_best_product".tr,
                        productDescription: "msg_nike_air_zoom_pegasus2".tr,
                        dateText: "msg_june_3_2015_5_06".tr),
                    SizedBox(height: 5.v),
                    _buildFeedItemRow(context,
                        productImage: ImageConstant.imgProductImage1,
                        bestProductText: "lbl_new_product".tr,
                        productDescription: "msg_nike_air_zoom_pegasus2".tr,
                        dateText: "msg_june_3_2015_5_06".tr)
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 15.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_feed".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Common widget
  Widget _buildFeedItemRow(
    BuildContext context, {
    required String productImage,
    required String bestProductText,
    required String productDescription,
    required String dateText,
  }) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: productImage,
              height: 48.adaptSize,
              width: 48.adaptSize,
              radius: BorderRadius.circular(5.h),
              margin: EdgeInsets.only(bottom: 40.v)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(bestProductText,
                            style: theme.textTheme.titleSmall!.copyWith(
                                color: theme.colorScheme.onPrimary
                                    .withOpacity(1))),
                        SizedBox(height: 6.v),
                        SizedBox(
                            width: 269.h,
                            child: Text(productDescription,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodySmall!.copyWith(
                                    color: appTheme.blueGray300,
                                    height: 1.80))),
                        SizedBox(height: 1.v),
                        Text(dateText,
                            style: CustomTextStyles.bodySmallOnPrimary10
                                .copyWith(
                                    color: theme.colorScheme.onPrimary
                                        .withOpacity(1)))
                      ])))
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
