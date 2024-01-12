// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'widget_item_model.dart';
import '../../../core/app_export.dart';
import 'sizes_item_model.dart';
import 'bluelist_item_model.dart';
import 'products1_item_model.dart';
import 'recommended_item_model.dart';

/// This class defines the variables used in the [product_detail_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ProductDetailModel extends Equatable {
  ProductDetailModel({
    this.widgetItemList = const [],
    this.sizesItemList = const [],
    this.bluelistItemList = const [],
    this.products1ItemList = const [],
    this.recommendedItemList = const [],
  }) {}

  List<WidgetItemModel> widgetItemList;

  List<SizesItemModel> sizesItemList;

  List<BluelistItemModel> bluelistItemList;

  List<Products1ItemModel> products1ItemList;

  List<RecommendedItemModel> recommendedItemList;

  ProductDetailModel copyWith({
    List<WidgetItemModel>? widgetItemList,
    List<SizesItemModel>? sizesItemList,
    List<BluelistItemModel>? bluelistItemList,
    List<Products1ItemModel>? products1ItemList,
    List<RecommendedItemModel>? recommendedItemList,
  }) {
    return ProductDetailModel(
      widgetItemList: widgetItemList ?? this.widgetItemList,
      sizesItemList: sizesItemList ?? this.sizesItemList,
      bluelistItemList: bluelistItemList ?? this.bluelistItemList,
      products1ItemList: products1ItemList ?? this.products1ItemList,
      recommendedItemList: recommendedItemList ?? this.recommendedItemList,
    );
  }

  @override
  List<Object?> get props => [
        widgetItemList,
        sizesItemList,
        bluelistItemList,
        products1ItemList,
        recommendedItemList
      ];
}
