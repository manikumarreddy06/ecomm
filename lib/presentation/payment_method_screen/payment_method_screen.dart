import 'bloc/payment_method_bloc.dart';
import 'models/payment_method_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';
import 'package:momskart/widgets/app_bar/appbar_leading_image.dart';
import 'package:momskart/widgets/app_bar/appbar_subtitle.dart';
import 'package:momskart/widgets/app_bar/custom_app_bar.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<PaymentMethodBloc>(
        create: (context) => PaymentMethodBloc(
            PaymentMethodState(paymentMethodModelObj: PaymentMethodModel()))
          ..add(PaymentMethodInitialEvent()),
        child: PaymentMethodScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              appBar: _buildAppBar(context),
              body: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 10.v),
                  child: Column(children: [
                    _buildPaymentOptionPaypal(context,
                        paypalIcon: ImageConstant.imgCreditCardIcon,
                        paypalText: "msg_credit_card_or_debit".tr,
                        onTapPaymentOptionPaypal: () {
                      onTapPaymentOptionPaypal(context);
                    }),
                    _buildPaymentOptionPaypal(context,
                        paypalIcon: ImageConstant.imgPaypalIcon,
                        paypalText: "lbl_paypal".tr),
                    SizedBox(height: 5.v),
                    _buildPaymentOptionPaypal(context,
                        paypalIcon: ImageConstant.imgBankIcon,
                        paypalText: "lbl_bank_transfer".tr)
                  ]))));
    });
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_payment".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Common widget
  Widget _buildPaymentOptionPaypal(
    BuildContext context, {
    required String paypalIcon,
    required String paypalText,
    Function? onTapPaymentOptionPaypal,
  }) {
    return GestureDetector(
        onTap: () {
          onTapPaymentOptionPaypal!.call();
        },
        child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(16.h),
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Row(children: [
              CustomImageView(
                  imagePath: paypalIcon,
                  height: 24.adaptSize,
                  width: 24.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 4.v),
                  child: Text(paypalText,
                      style: theme.textTheme.labelLarge!.copyWith(
                          color: theme.colorScheme.onPrimary.withOpacity(1))))
            ])));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the chooseCreditOrDebitCardScreen when the action is triggered.
  onTapPaymentOptionPaypal(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.chooseCreditOrDebitCardScreen,
    );
  }
}
