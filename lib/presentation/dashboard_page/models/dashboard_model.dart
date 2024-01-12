// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'offerbanner_item_model.dart';
import '../../../core/app_export.dart';
import 'arrowright_item_model.dart';
import 'flashsale_item_model.dart';
import 'megasale_item_model.dart';
import 'products_item_model.dart';

/// This class defines the variables used in the [dashboard_page],
/// and is typically used to hold data that is passed between different parts of the application.
class DashboardModel extends Equatable {
  DashboardModel({
    this.offerbannerItemList = const [],
    this.arrowrightItemList = const [],
    this.flashsaleItemList = const [],
    this.megasaleItemList = const [],
    this.productsItemList = const [],
  }) {}

  List<OfferbannerItemModel> offerbannerItemList;

  List<ArrowrightItemModel> arrowrightItemList;

  List<FlashsaleItemModel> flashsaleItemList;

  List<MegasaleItemModel> megasaleItemList;

  List<ProductsItemModel> productsItemList;

  DashboardModel copyWith({
    List<OfferbannerItemModel>? offerbannerItemList,
    List<ArrowrightItemModel>? arrowrightItemList,
    List<FlashsaleItemModel>? flashsaleItemList,
    List<MegasaleItemModel>? megasaleItemList,
    List<ProductsItemModel>? productsItemList,
  }) {
    return DashboardModel(
      offerbannerItemList: offerbannerItemList ?? this.offerbannerItemList,
      arrowrightItemList: arrowrightItemList ?? this.arrowrightItemList,
      flashsaleItemList: flashsaleItemList ?? this.flashsaleItemList,
      megasaleItemList: megasaleItemList ?? this.megasaleItemList,
      productsItemList: productsItemList ?? this.productsItemList,
    );
  }

  @override
  List<Object?> get props => [
        offerbannerItemList,
        arrowrightItemList,
        flashsaleItemList,
        megasaleItemList,
        productsItemList
      ];
}
