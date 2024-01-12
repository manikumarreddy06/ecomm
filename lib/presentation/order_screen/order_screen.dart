import '../order_screen/widgets/orders_item_widget.dart';
import 'bloc/order_bloc.dart';
import 'models/order_model.dart';
import 'models/orders_item_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';
import 'package:momskart/widgets/app_bar/appbar_leading_image.dart';
import 'package:momskart/widgets/app_bar/appbar_subtitle.dart';
import 'package:momskart/widgets/app_bar/custom_app_bar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<OrderBloc>(
        create: (context) => OrderBloc(OrderState(orderModelObj: OrderModel()))
          ..add(OrderInitialEvent()),
        child: OrderScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 15.h, top: 19.v, right: 15.h),
                child: BlocSelector<OrderBloc, OrderState, OrderModel?>(
                    selector: (state) => state.orderModelObj,
                    builder: (context, orderModelObj) {
                      return ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0.v),
                                child: SizedBox(
                                    width: 344.h,
                                    child: Divider(
                                        height: 1.v,
                                        thickness: 1.v,
                                        color: appTheme.blue50)));
                          },
                          itemCount: orderModelObj?.ordersItemList.length ?? 0,
                          itemBuilder: (context, index) {
                            OrdersItemModel model =
                                orderModelObj?.ordersItemList[index] ??
                                    OrdersItemModel();
                            return OrdersItemWidget(model);
                          });
                    }))));
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
            text: "lbl_order".tr, margin: EdgeInsets.only(left: 12.h)));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
