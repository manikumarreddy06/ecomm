import '../search_result_screen/widgets/searchresult_item_widget.dart';
import 'bloc/search_result_bloc.dart';
import 'models/search_result_model.dart';
import 'models/searchresult_item_model.dart';
import 'package:flutter/material.dart';
import 'package:momskart/core/app_export.dart';
import 'package:momskart/widgets/app_bar/appbar_title_image.dart';
import 'package:momskart/widgets/app_bar/appbar_title_searchview_two.dart';
import 'package:momskart/widgets/app_bar/custom_app_bar.dart';
import 'package:momskart/widgets/custom_drop_down.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SearchResultBloc>(
        create: (context) => SearchResultBloc(
            SearchResultState(searchResultModelObj: SearchResultModel()))
          ..add(SearchResultInitialEvent()),
        child: SearchResultScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.v),
                child: Column(children: [
                  _buildResultCounter(context),
                  SizedBox(height: 16.v),
                  _buildSearchResult(context)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 79.v,
        centerTitle: true,
        title: Column(children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Row(children: [
                BlocSelector<SearchResultBloc, SearchResultState,
                        TextEditingController?>(
                    selector: (state) => state.searchController,
                    builder: (context, searchController) {
                      return AppbarTitleSearchviewTwo(
                          hintText: "lbl_nike_air_max".tr,
                          controller: searchController);
                    }),
                AppbarTitleImage(
                    imagePath: ImageConstant.imgShortIcon,
                    margin: EdgeInsets.only(left: 16.h, top: 9.v, bottom: 9.v),
                    onTap: () {
                      onTapShortIcon(context);
                    }),
                AppbarTitleImage(
                    imagePath: ImageConstant.imgFilter,
                    margin: EdgeInsets.only(left: 16.h, top: 9.v, bottom: 9.v),
                    onTap: () {
                      onTapFilter(context);
                    })
              ])),
          SizedBox(height: 18.v),
          SizedBox(width: double.maxFinite, child: Divider())
        ]),
        styleType: Style.bgFill_1);
  }

  /// Section Widget
  Widget _buildResultCounter(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
              opacity: 0.5,
              child: Padding(
                  padding: EdgeInsets.only(top: 1.v, bottom: 4.v),
                  child: Text("lbl_145_result".tr,
                      style: CustomTextStyles.labelLargeOnPrimary))),
          BlocSelector<SearchResultBloc, SearchResultState, SearchResultModel?>(
              selector: (state) => state.searchResultModelObj,
              builder: (context, searchResultModelObj) {
                return CustomDropDown(
                    width: 103.h,
                    icon: Container(
                        margin: EdgeInsets.only(left: 8.h),
                        child: CustomImageView(
                            imagePath: ImageConstant.imgDownIcon,
                            height: 24.adaptSize,
                            width: 24.adaptSize)),
                    hintText: "lbl_man_shoes".tr,
                    items: searchResultModelObj?.dropdownItemList ?? [],
                    onChanged: (value) {
                      context
                          .read<SearchResultBloc>()
                          .add(ChangeDropDownEvent(value: value));
                    });
              })
        ]);
  }

  /// Section Widget
  Widget _buildSearchResult(BuildContext context) {
    return Expanded(
        child: BlocSelector<SearchResultBloc, SearchResultState,
                SearchResultModel?>(
            selector: (state) => state.searchResultModelObj,
            builder: (context, searchResultModelObj) {
              return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 283.v,
                      crossAxisCount: 2,
                      mainAxisSpacing: 13.h,
                      crossAxisSpacing: 13.h),
                  physics: BouncingScrollPhysics(),
                  itemCount:
                      searchResultModelObj?.searchresultItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    SearchresultItemModel model =
                        searchResultModelObj?.searchresultItemList[index] ??
                            SearchresultItemModel();
                    return SearchresultItemWidget(model);
                  });
            }));
  }

  /// Navigates to the sortByScreen when the action is triggered.
  onTapShortIcon(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.sortByScreen,
    );
  }

  /// Navigates to the filterScreen when the action is triggered.
  onTapFilter(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.filterScreen,
    );
  }
}
