import 'bloc/notification_activity_bloc.dart';
import 'models/notification_activity_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';
import 'package:momskart/widgets/app_bar/appbar_leading_image.dart';
import 'package:momskart/widgets/app_bar/appbar_subtitle.dart';
import 'package:momskart/widgets/app_bar/custom_app_bar.dart';

class NotificationActivityScreen extends StatelessWidget {
  const NotificationActivityScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<NotificationActivityBloc>(
        create: (context) => NotificationActivityBloc(NotificationActivityState(
            notificationActivityModelObj: NotificationActivityModel()))
          ..add(NotificationActivityInitialEvent()),
        child: NotificationActivityScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationActivityBloc, NotificationActivityState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 11.v),
                  child: Column(children: [
                    _buildActivityDetails(context,
                        transactionTitle: "msg_transaction_nike".tr,
                        transactionDescription:
                            "msg_culpa_cillum_consectetur".tr,
                        transactionTime: "msg_april_30_2014_1_01".tr,
                        onTapTransactionIcon: () {
                      onTapTransactionIcon(context);
                    }),
                    _buildActivityDetails(context,
                        transactionTitle: "msg_transaction_nike2".tr,
                        transactionDescription:
                            "msg_culpa_cillum_consectetur".tr,
                        transactionTime: "msg_april_30_2014_1_01".tr),
                    SizedBox(height: 5.v),
                    _buildActivityDetails(context,
                        transactionTitle: "msg_transaction_nike3".tr,
                        transactionDescription:
                            "msg_culpa_cillum_consectetur".tr,
                        transactionTime: "msg_april_30_2014_1_01".tr)
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
            text: "lbl_activity".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Common widget
  Widget _buildActivityDetails(
    BuildContext context, {
    required String transactionTitle,
    required String transactionDescription,
    required String transactionTime,
    Function? onTapTransactionIcon,
  }) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(16.h),
        decoration: AppDecoration.fillOnPrimaryContainer,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgTransactionIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(bottom: 94.v),
                  onTap: () {
                    onTapTransactionIcon!.call();
                  }),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(left: 12.h),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(transactionTitle,
                                style: theme.textTheme.titleSmall!.copyWith(
                                    color: theme.colorScheme.onPrimary
                                        .withOpacity(1))),
                            SizedBox(height: 11.v),
                            SizedBox(
                                width: 305.h,
                                child: Text(transactionDescription,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodySmall!.copyWith(
                                        color: appTheme.blueGray300,
                                        height: 1.80))),
                            SizedBox(height: 5.v),
                            Text(transactionTime,
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

  /// Navigates to the previous screen.
  onTapTransactionIcon(BuildContext context) {
    NavigatorService.goBack();
  }
}
