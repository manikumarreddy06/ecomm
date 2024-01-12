// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'categoriesgrid_item_model.dart';
import 'categoriesgrid1_item_model.dart';

/// This class defines the variables used in the [explore_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ExploreModel extends Equatable {
  ExploreModel({
    this.categoriesgridItemList = const [],
    this.categoriesgrid1ItemList = const [],
  }) {}

  List<CategoriesgridItemModel> categoriesgridItemList;

  List<Categoriesgrid1ItemModel> categoriesgrid1ItemList;

  ExploreModel copyWith({
    List<CategoriesgridItemModel>? categoriesgridItemList,
    List<Categoriesgrid1ItemModel>? categoriesgrid1ItemList,
  }) {
    return ExploreModel(
      categoriesgridItemList:
          categoriesgridItemList ?? this.categoriesgridItemList,
      categoriesgrid1ItemList:
          categoriesgrid1ItemList ?? this.categoriesgrid1ItemList,
    );
  }

  @override
  List<Object?> get props => [categoriesgridItemList, categoriesgrid1ItemList];
}
