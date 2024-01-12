import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/widget_item_model.dart';
import '../models/sizes_item_model.dart';
import '../models/bluelist_item_model.dart';
import '../models/products1_item_model.dart';
import '../models/recommended_item_model.dart';
import 'package:momskart/presentation/product_detail_screen/models/product_detail_model.dart';
part 'product_detail_event.dart';
part 'product_detail_state.dart';

/// A bloc that manages the state of a ProductDetail according to the event that is dispatched to it.
class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc(ProductDetailState initialState) : super(initialState) {
    on<ProductDetailInitialEvent>(_onInitialize);
  }

  List<WidgetItemModel> fillWidgetItemList() {
    return List.generate(1, (index) => WidgetItemModel());
  }

  List<SizesItemModel> fillSizesItemList() {
    return [
      SizesItemModel(six: "6"),
      SizesItemModel(six: "6.5"),
      SizesItemModel(six: "7"),
      SizesItemModel(six: "7.5"),
      SizesItemModel(six: "8"),
      SizesItemModel(six: "8.5")
    ];
  }

  List<BluelistItemModel> fillBluelistItemList() {
    return List.generate(6, (index) => BluelistItemModel());
  }

  List<Products1ItemModel> fillProducts1ItemList() {
    return [
      Products1ItemModel(productPicture: ImageConstant.imgProductPicture02),
      Products1ItemModel(productPicture: ImageConstant.imgProductPicture03),
      Products1ItemModel(productPicture: ImageConstant.imgProductPicture01)
    ];
  }

  List<RecommendedItemModel> fillRecommendedItemList() {
    return [
      RecommendedItemModel(
          image: ImageConstant.imgProductImage,
          fSNikeAirMax: "FS - Nike Air Max 270 React...",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      RecommendedItemModel(
          image: ImageConstant.imgProductImage109x109,
          fSNikeAirMax: "FS - QUILTED MAXI CROS...",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      RecommendedItemModel(
          image: ImageConstant.imgProductImage1,
          fSNikeAirMax: "FS - Nike Air Max 270 React...",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off")
    ];
  }

  _onInitialize(
    ProductDetailInitialEvent event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(state.copyWith(sliderIndex: 0));
    emit(state.copyWith(
        productDetailModelObj: state.productDetailModelObj?.copyWith(
            widgetItemList: fillWidgetItemList(),
            sizesItemList: fillSizesItemList(),
            bluelistItemList: fillBluelistItemList(),
            products1ItemList: fillProducts1ItemList(),
            recommendedItemList: fillRecommendedItemList())));
  }
}
