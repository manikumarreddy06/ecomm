import '../order_details_screen/widgets/productlist_item_widget.dart';
import 'bloc/order_details_bloc.dart';
import 'models/order_details_model.dart';
import 'models/productlist_item_model.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';
import 'package:momskart/widgets/app_bar/appbar_leading_image.dart';
import 'package:momskart/widgets/app_bar/appbar_subtitle.dart';
import 'package:momskart/widgets/app_bar/custom_app_bar.dart';
import 'package:momskart/widgets/custom_elevated_button.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<OrderDetailsBloc>(
        create: (context) => OrderDetailsBloc(
            OrderDetailsState(orderDetailsModelObj: OrderDetailsModel()))
          ..add(OrderDetailsInitialEvent()),
        child: OrderDetailsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 10.v),
                child: Column(children: [
                  SizedBox(height: 27.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              margin: EdgeInsets.only(bottom: 5.v),
                              padding: EdgeInsets.symmetric(horizontal: 14.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildPacking(context),
                                    SizedBox(height: 24.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 2.h),
                                        child: Text("lbl_product".tr,
                                            style: theme.textTheme.titleSmall)),
                                    SizedBox(height: 12.v),
                                    _buildProductList(context),
                                    SizedBox(height: 24.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 2.h),
                                        child: Text("msg_shipping_details".tr,
                                            style: theme.textTheme.titleSmall)),
                                    SizedBox(height: 11.v),
                                    _buildShippingDetails(context),
                                    SizedBox(height: 46.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 2.h),
                                        child: Text("lbl_payment_details".tr,
                                            style: theme.textTheme.titleSmall)),
                                    SizedBox(height: 11.v),
                                    _buildTotalPrice(context)
                                  ]))))
                ])),
            bottomNavigationBar: _buildNotifyMe(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_order_details".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildPacking(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 5.h),
        child: Row(children: [
          SizedBox(height: 57.v, width: 51.h),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: IntrinsicWidth(
                  child: AnotherStepper(
                      iconHeight: 57,
                      iconWidth: 51,
                      stepperDirection: Axis.horizontal,
                      activeIndex: 0,
                      barThickness: 1,
                      inverted: true,
                      stepperList: [
                    StepperData(
                        iconWidget: Column(children: [
                      Container(
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.h, vertical: 9.v),
                          decoration: AppDecoration.fillPrimary.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder12),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgVector41,
                              height: 5.v,
                              width: 7.h,
                              alignment: Alignment.bottomRight)),
                      Padding(
                          padding: EdgeInsets.only(top: 15.v),
                          child: Text("lbl_packing".tr,
                              style: theme.textTheme.bodySmall))
                    ])),
                    StepperData(
                        iconWidget: Column(children: [
                      Container(
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.h, vertical: 9.v),
                          decoration: AppDecoration.fillPrimary.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder12),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgVector41,
                              height: 5.v,
                              width: 7.h,
                              alignment: Alignment.bottomRight)),
                      Padding(
                          padding: EdgeInsets.only(top: 15.v),
                          child: Text("lbl_shipping".tr,
                              style: theme.textTheme.bodySmall))
                    ])),
                    StepperData(
                        iconWidget: Column(children: [
                      Container(
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.h, vertical: 9.v),
                          decoration: AppDecoration.fillPrimary.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder12),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgVector41,
                              height: 5.v,
                              width: 7.h,
                              alignment: Alignment.bottomRight)),
                      Padding(
                          padding: EdgeInsets.only(top: 15.v),
                          child: Text("lbl_arriving".tr,
                              style: theme.textTheme.bodySmall))
                    ])),
                    StepperData(
                        iconWidget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgCheckmarkBlue50,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                              margin: EdgeInsets.only(left: 13.h)),
                          Padding(
                              padding: EdgeInsets.only(top: 13.v),
                              child: Text("lbl_success".tr,
                                  style: theme.textTheme.bodySmall))
                        ]))
                  ]))),
          SizedBox(height: 57.v, width: 49.h),
          Spacer(),
          SizedBox(height: 55.v, width: 53.h)
        ]));
  }

  /// Section Widget
  Widget _buildProductList(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: BlocSelector<OrderDetailsBloc, OrderDetailsState,
                OrderDetailsModel?>(
            selector: (state) => state.orderDetailsModelObj,
            builder: (context, orderDetailsModelObj) {
              return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 8.v);
                  },
                  itemCount:
                      orderDetailsModelObj?.productlistItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    ProductlistItemModel model =
                        orderDetailsModelObj?.productlistItemList[index] ??
                            ProductlistItemModel();
                    return ProductlistItemWidget(model);
                  });
            }));
  }

  /// Section Widget
  Widget _buildShippingDetails(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 11.v),
        decoration: AppDecoration.outlineBlue
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 6.v),
          _buildShipping(context,
              shippingText: "lbl_date_shipping".tr,
              pOSReggular: "msg_january_16_2020".tr),
          SizedBox(height: 15.v),
          _buildShipping(context,
              shippingText: "lbl_shipping".tr,
              pOSReggular: "lbl_pos_reggular".tr),
          SizedBox(height: 14.v),
          _buildShipping(context,
              shippingText: "lbl_no_resi".tr,
              pOSReggular: "lbl_000192848573".tr),
          SizedBox(height: 15.v),
          _buildShipping(context,
              shippingText: "lbl_address".tr,
              pOSReggular: "msg_2727_new_owerri".tr)
        ]));
  }

  /// Section Widget
  Widget _buildTotalPrice(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 1.h, right: 2.h),
        padding: EdgeInsets.all(15.h),
        decoration: AppDecoration.outlineBlue
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildShippingPrice(context,
                  shippingText: "lbl_items_3".tr, priceText: "lbl_598_86".tr),
              SizedBox(height: 16.v),
              _buildShippingPrice(context,
                  shippingText: "lbl_shipping".tr, priceText: "lbl_40_00".tr),
              SizedBox(height: 14.v),
              _buildShippingPrice(context,
                  shippingText: "lbl_import_charges".tr,
                  priceText: "lbl_128_00".tr),
              SizedBox(height: 12.v),
              Divider(),
              SizedBox(height: 10.v),
              _buildShippingPrice(context,
                  shippingText: "lbl_total_price".tr,
                  priceText: "lbl_766_86".tr)
            ]));
  }

  /// Section Widget
  Widget _buildNotifyMe(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_notify_me".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }

  /// Common widget
  Widget _buildShipping(
    BuildContext context, {
    required String shippingText,
    required String pOSReggular,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Opacity(
          opacity: 0.5,
          child: Text(shippingText,
              style: CustomTextStyles.bodySmallOnPrimary_1
                  .copyWith(color: theme.colorScheme.onPrimary))),
      Text(pOSReggular,
          style: CustomTextStyles.bodySmallOnPrimary
              .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1)))
    ]);
  }

  /// Common widget
  Widget _buildShippingPrice(
    BuildContext context, {
    required String shippingText,
    required String priceText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(shippingText,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: appTheme.blueGray300))),
      Text(priceText,
          style: CustomTextStyles.bodySmallOnPrimary
              .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1)))
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
