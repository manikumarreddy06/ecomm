import 'bloc/add_card_bloc.dart';
import 'models/add_card_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';
import 'package:momskart/core/utils/validation_functions.dart';
import 'package:momskart/widgets/app_bar/appbar_leading_image.dart';
import 'package:momskart/widgets/app_bar/appbar_subtitle.dart';
import 'package:momskart/widgets/app_bar/custom_app_bar.dart';
import 'package:momskart/widgets/custom_elevated_button.dart';
import 'package:momskart/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class AddCardScreen extends StatelessWidget {
  AddCardScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddCardBloc>(
        create: (context) =>
            AddCardBloc(AddCardState(addCardModelObj: AddCardModel()))
              ..add(AddCardInitialEvent()),
        child: AddCardScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 27.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("lbl_card_number".tr,
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 12.v),
                                  _buildCardNumberEditText(context),
                                  SizedBox(height: 24.v),
                                  Text("lbl_expiration_date".tr,
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 11.v),
                                  _buildExpirationDateEditText(context),
                                  SizedBox(height: 29.v),
                                  Text("lbl_security_code".tr,
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 11.v),
                                  _buildSecurityCodeEditText(context),
                                  SizedBox(height: 23.v),
                                  Text("lbl_card_holder2".tr,
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 12.v),
                                  _buildCardHolderEditText(context),
                                  SizedBox(height: 5.v)
                                ]))))),
            bottomNavigationBar: _buildAddCardButton(context)));
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
            text: "lbl_add_card".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildCardNumberEditText(BuildContext context) {
    return BlocSelector<AddCardBloc, AddCardState, TextEditingController?>(
        selector: (state) => state.cardNumberEditTextController,
        builder: (context, cardNumberEditTextController) {
          return CustomTextFormField(
              controller: cardNumberEditTextController,
              hintText: "msg_enter_card_number".tr,
              textInputType: TextInputType.number,
              validator: (value) {
                if (!isNumeric(value)) {
                  return "err_msg_please_enter_valid_number".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildExpirationDateEditText(BuildContext context) {
    return BlocSelector<AddCardBloc, AddCardState, TextEditingController?>(
        selector: (state) => state.expirationDateEditTextController,
        builder: (context, expirationDateEditTextController) {
          return CustomTextFormField(
              controller: expirationDateEditTextController,
              hintText: "lbl_expiration_date".tr);
        });
  }

  /// Section Widget
  Widget _buildSecurityCodeEditText(BuildContext context) {
    return BlocSelector<AddCardBloc, AddCardState, TextEditingController?>(
        selector: (state) => state.securityCodeEditTextController,
        builder: (context, securityCodeEditTextController) {
          return CustomTextFormField(
              controller: securityCodeEditTextController,
              hintText: "lbl_security_code".tr);
        });
  }

  /// Section Widget
  Widget _buildCardHolderEditText(BuildContext context) {
    return BlocSelector<AddCardBloc, AddCardState, TextEditingController?>(
        selector: (state) => state.cardHolderEditTextController,
        builder: (context, cardHolderEditTextController) {
          return CustomTextFormField(
              controller: cardHolderEditTextController,
              hintText: "msg_enter_card_number".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.number,
              validator: (value) {
                if (!isNumeric(value)) {
                  return "err_msg_please_enter_valid_number".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildAddCardButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_add_card".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v),
        onPressed: () {
          onTapAddCardButton(context);
        });
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the creditCardAndDebitScreen when the action is triggered.
  onTapAddCardButton(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.creditCardAndDebitScreen,
    );
  }
}
