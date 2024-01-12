import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/offerbanner_item_model.dart';
import '../models/arrowright_item_model.dart';
import '../models/flashsale_item_model.dart';
import '../models/megasale_item_model.dart';
import '../models/products_item_model.dart';
import 'package:momskart/presentation/dashboard_page/models/dashboard_model.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

/// A bloc that manages the state of a Dashboard according to the event that is dispatched to it.
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(DashboardState initialState) : super(initialState) {
    on<DashboardInitialEvent>(_onInitialize);
  }

  List<OfferbannerItemModel> fillOfferbannerItemList() {
    return List.generate(1, (index) => OfferbannerItemModel());
  }

  List<ArrowrightItemModel> fillArrowrightItemList() {
    return [
      ArrowrightItemModel(
          arrowRight: ImageConstant.imgArrowRight, manShirt: "Man Shirt"),
      ArrowrightItemModel(
          arrowRight: ImageConstant.imgManWorkEquipment,
          manShirt: "Office Bag"),
      ArrowrightItemModel(
          arrowRight: ImageConstant.imgDressIcon, manShirt: "Dress"),
      ArrowrightItemModel(
          arrowRight: ImageConstant.imgWomanBagIcon, manShirt: "Woman Bag"),
      ArrowrightItemModel(
          arrowRight: ImageConstant.imgManShoesIcon, manShirt: "Man Shoes")
    ];
  }

  List<FlashsaleItemModel> fillFlashsaleItemList() {
    return [
      FlashsaleItemModel(
          image: ImageConstant.imgProductImage,
          fSNikeAirMax: "FS - Nike Air Max 270 React...",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      FlashsaleItemModel(
          image: ImageConstant.imgProductImage109x109,
          fSNikeAirMax: "FS - QUILTED MAXI CROS...",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      FlashsaleItemModel(
          image: ImageConstant.imgProductImage1,
          fSNikeAirMax: "FS - Nike Air Max 270 React...",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off")
    ];
  }

  List<MegasaleItemModel> fillMegasaleItemList() {
    return [
      MegasaleItemModel(
          image: ImageConstant.imgProductImage2,
          mSNikeAirMax: "MS - Nike Air Max 270 React...",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      MegasaleItemModel(
          image: ImageConstant.imgProductImage3,
          mSNikeAirMax: "MS - Nike Air Max 270 React...",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      MegasaleItemModel(
          image: ImageConstant.imgProductImage4,
          mSNikeAirMax: "MS - Nike Air Max 270 React...",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off")
    ];
  }

  List<ProductsItemModel> fillProductsItemList() {
    return [
      ProductsItemModel(
          image: ImageConstant.imgImageProduct,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      ProductsItemModel(
          image: ImageConstant.imgProductImage2,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      ProductsItemModel(
          image: ImageConstant.imgProductImage133x133,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      ProductsItemModel(
          image: ImageConstant.imgProductImage1,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off")
    ];
  }

  _onInitialize(
    DashboardInitialEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(sliderIndex: 0));
    emit(state.copyWith(
        dashboardModelObj: state.dashboardModelObj?.copyWith(
            offerbannerItemList: fillOfferbannerItemList(),
            arrowrightItemList: fillArrowrightItemList(),
            flashsaleItemList: fillFlashsaleItemList(),
            megasaleItemList: fillMegasaleItemList(),
            productsItemList: fillProductsItemList())));
  }
}
