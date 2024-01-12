import '../dashboard_page/widgets/arrowright_item_widget.dart';
import '../dashboard_page/widgets/flashsale_item_widget.dart';
import '../dashboard_page/widgets/megasale_item_widget.dart';
import '../dashboard_page/widgets/offerbanner_item_widget.dart';
import '../dashboard_page/widgets/products_item_widget.dart';
import 'bloc/dashboard_bloc.dart';
import 'models/arrowright_item_model.dart';
import 'models/dashboard_model.dart';
import 'models/flashsale_item_model.dart';
import 'models/megasale_item_model.dart';
import 'models/offerbanner_item_model.dart';
import 'models/products_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';
import 'package:momskart/widgets/app_bar/appbar_leading_image.dart';
import 'package:momskart/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:momskart/widgets/app_bar/appbar_trailing_image.dart';
import 'package:momskart/widgets/app_bar/custom_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<DashboardBloc>(
        create: (context) =>
            DashboardBloc(DashboardState(dashboardModelObj: DashboardModel()))
              ..add(DashboardInitialEvent()),
        child: DashboardPage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 27.v),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: Column(children: [
                          _buildOfferBanner(context),
                          SizedBox(height: 16.v),
                          BlocBuilder<DashboardBloc, DashboardState>(
                              builder: (context, state) {
                            return SizedBox(
                                height: 8.v,
                                child: AnimatedSmoothIndicator(
                                    activeIndex: state.sliderIndex,
                                    count: state.dashboardModelObj
                                            ?.offerbannerItemList.length ??
                                        0,
                                    axisDirection: Axis.horizontal,
                                    effect: ScrollingDotsEffect(
                                        spacing: 8,
                                        activeDotColor: theme
                                            .colorScheme.primary
                                            .withOpacity(1),
                                        dotColor: appTheme.blue50,
                                        dotHeight: 8.v,
                                        dotWidth: 8.h)));
                          }),
                          SizedBox(height: 25.v),
                          _buildCategories(context),
                          SizedBox(height: 37.v),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: _buildFlashSaleHeader(context,
                                  flashSaleText: "lbl_flash_sale".tr,
                                  seeMoreText: "lbl_see_more".tr,
                                  onTapFlashSaleHeader: () {
                                onTapFlashSaleHeader(context);
                              })),
                          SizedBox(height: 12.v),
                          _buildFlashSale(context),
                          SizedBox(height: 23.v),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: _buildFlashSaleHeader(context,
                                  flashSaleText: "lbl_mega_sale".tr,
                                  seeMoreText: "lbl_see_more".tr)),
                          SizedBox(height: 10.v),
                          _buildMegaSale(context),
                          SizedBox(height: 29.v),
                          CustomImageView(
                              imagePath: ImageConstant.imgRecomendedProduct,
                              height: 206.v,
                              width: 343.h,
                              radius: BorderRadius.circular(5.h)),
                          SizedBox(height: 16.v),
                          _buildProducts(context)
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 48.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgRewind,
            margin: EdgeInsets.only(left: 32.h, top: 20.v, bottom: 20.v)),
        title: AppbarSubtitleOne(
            text: "lbl_search_product".tr,
            margin: EdgeInsets.only(left: 8.h),
            onTap: () {
              onTapSearchProduct(context);
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgLoveIcon,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 16.h),
              onTap: () {
                onTapLoveIcon(context);
              }),
          Container(
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(left: 16.h, top: 16.v, right: 32.h),
              child: Stack(alignment: Alignment.topRight, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgNotificationIcon,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    alignment: Alignment.center,
                    onTap: () {
                      onTapImgNotificationIcon(context);
                    }),
                CustomImageView(
                    imagePath: ImageConstant.imgClosePink300,
                    height: 8.adaptSize,
                    width: 8.adaptSize,
                    alignment: Alignment.topRight,
                    margin:
                        EdgeInsets.only(left: 14.h, right: 2.h, bottom: 16.v))
              ]))
        ]);
  }

  /// Section Widget
  Widget _buildOfferBanner(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
          return CarouselSlider.builder(
              options: CarouselOptions(
                  height: 206.v,
                  initialPage: 0,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    state.sliderIndex = index;
                  }),
              itemCount:
                  state.dashboardModelObj?.offerbannerItemList.length ?? 0,
              itemBuilder: (context, index, realIndex) {
                OfferbannerItemModel model =
                    state.dashboardModelObj?.offerbannerItemList[index] ??
                        OfferbannerItemModel();
                return OfferbannerItemWidget(model);
              });
        }));
  }

  /// Section Widget
  Widget _buildCategories(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(right: 16.h),
              child: _buildFlashSaleHeader(context,
                  flashSaleText: "lbl_category".tr,
                  seeMoreText: "lbl_more_category".tr, onTapSeeMoreText: () {
                onTapTxtSeeMoreText(context);
              })),
          SizedBox(height: 10.v),
          SizedBox(
              height: 94.v,
              child:
                  BlocSelector<DashboardBloc, DashboardState, DashboardModel?>(
                      selector: (state) => state.dashboardModelObj,
                      builder: (context, dashboardModelObj) {
                        return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 12.h);
                            },
                            itemCount:
                                dashboardModelObj?.arrowrightItemList.length ??
                                    0,
                            itemBuilder: (context, index) {
                              ArrowrightItemModel model = dashboardModelObj
                                      ?.arrowrightItemList[index] ??
                                  ArrowrightItemModel();
                              return ArrowrightItemWidget(model);
                            });
                      }))
        ]));
  }

  /// Section Widget
  Widget _buildFlashSale(BuildContext context) {
    return SizedBox(
        height: 238.v,
        child: BlocSelector<DashboardBloc, DashboardState, DashboardModel?>(
            selector: (state) => state.dashboardModelObj,
            builder: (context, dashboardModelObj) {
              return ListView.separated(
                  padding: EdgeInsets.only(left: 16.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 16.h);
                  },
                  itemCount: dashboardModelObj?.flashsaleItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    FlashsaleItemModel model =
                        dashboardModelObj?.flashsaleItemList[index] ??
                            FlashsaleItemModel();
                    return FlashsaleItemWidget(model, onTapProductItem: () {
                      onTapProductItem(context);
                    });
                  });
            }));
  }

  /// Section Widget
  Widget _buildMegaSale(BuildContext context) {
    return SizedBox(
        height: 238.v,
        child: BlocSelector<DashboardBloc, DashboardState, DashboardModel?>(
            selector: (state) => state.dashboardModelObj,
            builder: (context, dashboardModelObj) {
              return ListView.separated(
                  padding: EdgeInsets.only(left: 16.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 16.h);
                  },
                  itemCount: dashboardModelObj?.megasaleItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    MegasaleItemModel model =
                        dashboardModelObj?.megasaleItemList[index] ??
                            MegasaleItemModel();
                    return MegasaleItemWidget(model);
                  });
            }));
  }

  /// Section Widget
  Widget _buildProducts(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: BlocSelector<DashboardBloc, DashboardState, DashboardModel?>(
            selector: (state) => state.dashboardModelObj,
            builder: (context, dashboardModelObj) {
              return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 283.v,
                      crossAxisCount: 2,
                      mainAxisSpacing: 13.h,
                      crossAxisSpacing: 13.h),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dashboardModelObj?.productsItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    ProductsItemModel model =
                        dashboardModelObj?.productsItemList[index] ??
                            ProductsItemModel();
                    return ProductsItemWidget(model);
                  });
            }));
  }

  /// Common widget
  Widget _buildFlashSaleHeader(
    BuildContext context, {
    required String flashSaleText,
    required String seeMoreText,
    Function? onTapFlashSaleHeader,
    Function? onTapSeeMoreText,
  }) {
    return GestureDetector(
        onTap: () {
          onTapFlashSaleHeader!.call();
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(flashSaleText,
              style: theme.textTheme.titleSmall!
                  .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1))),
          GestureDetector(
              onTap: () {
                onTapSeeMoreText!.call();
              },
              child: Text(seeMoreText,
                  style: CustomTextStyles.titleSmallPrimary.copyWith(
                      color: theme.colorScheme.primary.withOpacity(1))))
        ]));
  }

  /// Navigates to the searchScreen when the action is triggered.
  onTapSearchProduct(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.searchScreen);
  }

  /// Navigates to the favoriteProductScreen when the action is triggered.
  onTapLoveIcon(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.favoriteProductScreen);
  }

  /// Navigates to the notificationScreen when the action is triggered.
  onTapImgNotificationIcon(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.notificationScreen);
  }

  /// Navigates to the listCategoryScreen when the action is triggered.
  onTapTxtSeeMoreText(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.listCategoryScreen);
  }

  /// Navigates to the superFlashSaleScreen when the action is triggered.
  onTapFlashSaleHeader(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.superFlashSaleScreen);
  }

  /// Navigates to the productDetailScreen when the action is triggered.
  onTapProductItem(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.productDetailScreen,
    );
  }
}
