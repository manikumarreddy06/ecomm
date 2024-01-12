import 'bloc/account_bloc.dart';
import 'models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';
import 'package:momskart/widgets/app_bar/appbar_title.dart';
import 'package:momskart/widgets/app_bar/appbar_trailing_image.dart';
import 'package:momskart/widgets/app_bar/custom_app_bar.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<AccountBloc>(
        create: (context) =>
            AccountBloc(AccountState(accountModelObj: AccountModel()))
              ..add(AccountInitialEvent()),
        child: AccountPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 11.v),
                  child: Column(children: [
                    _buildAccountOptionOrder(context,
                        bagIcon: ImageConstant.imgLockPrimary,
                        order: "lbl_profile".tr, onTapAccountOptionOrder: () {
                      onTapAccountOptionOrder(context);
                    }),
                    _buildAccountOptionOrder(context,
                        bagIcon: ImageConstant.imgBagIcon,
                        order: "lbl_order".tr),
                    _buildAccountOptionOrder(context,
                        bagIcon: ImageConstant.imgLinkedin,
                        order: "lbl_address".tr),
                    SizedBox(height: 5.v),
                    _buildAccountOptionOrder(context,
                        bagIcon: ImageConstant.imgCreditCardIcon,
                        order: "lbl_payment".tr, onTapAccountOptionOrder: () {
                      onTapAccountOptionOrder1(context);
                    })
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: AppbarTitle(
            text: "lbl_account".tr, margin: EdgeInsets.only(left: 16.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotificationIcon,
              margin: EdgeInsets.fromLTRB(13.h, 15.v, 13.h, 16.v),
              onTap: () {
                onTapNotificationIcon(context);
              })
        ]);
  }

  /// Common widget
  Widget _buildAccountOptionOrder(
    BuildContext context, {
    required String bagIcon,
    required String order,
    Function? onTapAccountOptionOrder,
  }) {
    return GestureDetector(
        onTap: () {
          onTapAccountOptionOrder!.call();
        },
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(16.h),
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomImageView(
                  imagePath: bagIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 2.v, bottom: 3.v),
                  child: Text(order,
                      style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onPrimary.withOpacity(1))))
            ])));
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapNotificationIcon(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.notificationScreen,
    );
  }

  /// Navigates to the profileScreen when the action is triggered.
  onTapAccountOptionOrder(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.profileScreen,
    );
  }

  /// Navigates to the addPaymentScreen when the action is triggered.
  onTapAccountOptionOrder1(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.addPaymentScreen,
    );
  }
}
