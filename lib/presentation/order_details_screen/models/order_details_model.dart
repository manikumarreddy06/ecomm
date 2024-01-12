// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'productlist_item_model.dart';

/// This class defines the variables used in the [order_details_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OrderDetailsModel extends Equatable {
  OrderDetailsModel({this.productlistItemList = const []}) {}

  List<ProductlistItemModel> productlistItemList;

  OrderDetailsModel copyWith(
      {List<ProductlistItemModel>? productlistItemList}) {
    return OrderDetailsModel(
      productlistItemList: productlistItemList ?? this.productlistItemList,
    );
  }

  @override
  List<Object?> get props => [productlistItemList];
}
