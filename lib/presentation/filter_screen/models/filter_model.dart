// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'conditionchipview_item_model.dart';
import 'buyingformatchipview_item_model.dart';
import 'itemlocationchipview_item_model.dart';
import 'showonly_item_model.dart';

/// This class defines the variables used in the [filter_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class FilterModel extends Equatable {
  FilterModel({
    this.conditionchipviewItemList = const [],
    this.buyingformatchipviewItemList = const [],
    this.itemlocationchipviewItemList = const [],
    this.showonlyItemList = const [],
  }) {}

  List<ConditionchipviewItemModel> conditionchipviewItemList;

  List<BuyingformatchipviewItemModel> buyingformatchipviewItemList;

  List<ItemlocationchipviewItemModel> itemlocationchipviewItemList;

  List<ShowonlyItemModel> showonlyItemList;

  FilterModel copyWith({
    List<ConditionchipviewItemModel>? conditionchipviewItemList,
    List<BuyingformatchipviewItemModel>? buyingformatchipviewItemList,
    List<ItemlocationchipviewItemModel>? itemlocationchipviewItemList,
    List<ShowonlyItemModel>? showonlyItemList,
  }) {
    return FilterModel(
      conditionchipviewItemList:
          conditionchipviewItemList ?? this.conditionchipviewItemList,
      buyingformatchipviewItemList:
          buyingformatchipviewItemList ?? this.buyingformatchipviewItemList,
      itemlocationchipviewItemList:
          itemlocationchipviewItemList ?? this.itemlocationchipviewItemList,
      showonlyItemList: showonlyItemList ?? this.showonlyItemList,
    );
  }

  @override
  List<Object?> get props => [
        conditionchipviewItemList,
        buyingformatchipviewItemList,
        itemlocationchipviewItemList,
        showonlyItemList
      ];
}
