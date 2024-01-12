import 'bloc/add_address_bloc.dart';
import 'models/add_address_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';
import 'package:momskart/core/utils/validation_functions.dart';
import 'package:momskart/widgets/app_bar/appbar_leading_image.dart';
import 'package:momskart/widgets/app_bar/appbar_subtitle.dart';
import 'package:momskart/widgets/app_bar/custom_app_bar.dart';
import 'package:momskart/widgets/custom_elevated_button.dart';
import 'package:momskart/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<AddAddressBloc>(
        create: (context) => AddAddressBloc(
            AddAddressState(addAddressModelObj: AddAddressModel()))
          ..add(AddAddressInitialEvent()),
        child: AddAddressScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 10.v),
                    child: Column(children: [
                      SizedBox(height: 29.v),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                                  margin: EdgeInsets.only(bottom: 5.v),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.h),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("msg_country_or_region".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 11.v),
                                        _buildCountryEditText(context),
                                        SizedBox(height: 22.v),
                                        Text("lbl_first_name".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 13.v),
                                        _buildFirstNameEditText(context),
                                        SizedBox(height: 22.v),
                                        Text("lbl_last_name".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 12.v),
                                        _buildLastNameEditText(context),
                                        SizedBox(height: 23.v),
                                        Text("lbl_street_address".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 12.v),
                                        _buildStreetAddressEditText(context),
                                        SizedBox(height: 21.v),
                                        Text("msg_street_address_2".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 16.v),
                                        _buildStreetAddressTwoEditText(context),
                                        SizedBox(height: 22.v),
                                        Text("lbl_city".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 11.v),
                                        _buildCityEditText(context),
                                        SizedBox(height: 23.v),
                                        Text("msg_state_province_region".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 12.v),
                                        _buildOldPasswordEditText(context),
                                        SizedBox(height: 24.v),
                                        Text("lbl_zip_code".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 11.v),
                                        _buildZipCodeEditText(context),
                                        SizedBox(height: 23.v),
                                        Text("lbl_phone_number".tr,
                                            style: theme.textTheme.titleSmall),
                                        SizedBox(height: 12.v),
                                        _buildPhoneNumberEditText(context)
                                      ]))))
                    ]))),
            bottomNavigationBar: _buildAddAddressButton(context)));
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
            text: "lbl_add_address".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildCountryEditText(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.countryEditTextController,
        builder: (context, countryEditTextController) {
          return CustomTextFormField(
              controller: countryEditTextController,
              hintText: "msg_enter_the_country".tr,
              borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildFirstNameEditText(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.firstNameEditTextController,
        builder: (context, firstNameEditTextController) {
          return CustomTextFormField(
              controller: firstNameEditTextController,
              hintText: "msg_enter_the_first".tr,
              validator: (value) {
                if (!isText(value)) {
                  return "err_msg_please_enter_valid_text".tr;
                }
                return null;
              },
              borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildLastNameEditText(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.lastNameEditTextController,
        builder: (context, lastNameEditTextController) {
          return CustomTextFormField(
              controller: lastNameEditTextController,
              hintText: "msg_enter_the_last_name".tr,
              validator: (value) {
                if (!isText(value)) {
                  return "err_msg_please_enter_valid_text".tr;
                }
                return null;
              },
              borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildStreetAddressEditText(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.streetAddressEditTextController,
        builder: (context, streetAddressEditTextController) {
          return CustomTextFormField(
              controller: streetAddressEditTextController,
              hintText: "msg_enter_the_street".tr,
              borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildStreetAddressTwoEditText(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.streetAddressTwoEditTextController,
        builder: (context, streetAddressTwoEditTextController) {
          return CustomTextFormField(
              controller: streetAddressTwoEditTextController,
              hintText: "msg_enter_the_street2".tr,
              borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildCityEditText(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.cityEditTextController,
        builder: (context, cityEditTextController) {
          return CustomTextFormField(
              controller: cityEditTextController,
              hintText: "lbl_enter_the_city".tr,
              borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildOldPasswordEditText(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.oldPasswordEditTextController,
        builder: (context, oldPasswordEditTextController) {
          return CustomTextFormField(
              controller: oldPasswordEditTextController,
              hintText: "msg_enter_the_state".tr,
              borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildZipCodeEditText(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.zipCodeEditTextController,
        builder: (context, zipCodeEditTextController) {
          return CustomTextFormField(
              controller: zipCodeEditTextController,
              hintText: "msg_enter_the_zip_code".tr,
              textInputType: TextInputType.number,
              validator: (value) {
                if (!isNumeric(value)) {
                  return "err_msg_please_enter_valid_number".tr;
                }
                return null;
              },
              borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildPhoneNumberEditText(BuildContext context) {
    return BlocSelector<AddAddressBloc, AddAddressState,
            TextEditingController?>(
        selector: (state) => state.phoneNumberEditTextController,
        builder: (context, phoneNumberEditTextController) {
          return CustomTextFormField(
              controller: phoneNumberEditTextController,
              hintText: "msg_enter_the_phone".tr,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.phone,
              validator: (value) {
                if (!isValidPhone(value)) {
                  return "err_msg_please_enter_valid_phone_number".tr;
                }
                return null;
              },
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.h, vertical: 15.v),
              borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
              filled: false);
        });
  }

  /// Section Widget
  Widget _buildAddAddressButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_add_address".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
