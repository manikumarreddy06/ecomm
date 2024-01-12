import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/categoriesgrid_item_model.dart';
import '../models/categoriesgrid1_item_model.dart';
import 'package:momskart/presentation/explore_page/models/explore_model.dart';
part 'explore_event.dart';
part 'explore_state.dart';

/// A bloc that manages the state of a Explore according to the event that is dispatched to it.
class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc(ExploreState initialState) : super(initialState) {
    on<ExploreInitialEvent>(_onInitialize);
  }

  List<CategoriesgridItemModel> fillCategoriesgridItemList() {
    return [
      CategoriesgridItemModel(
          manWorkEquipment: ImageConstant.imgManWorkEquipment,
          officeBag: "Office Bag"),
      CategoriesgridItemModel(
          manWorkEquipment: ImageConstant.imgArrowRight, officeBag: "Shirt"),
      CategoriesgridItemModel(
          manWorkEquipment: ImageConstant.imgManTShirtIcon,
          officeBag: "T-Shirt"),
      CategoriesgridItemModel(
          manWorkEquipment: ImageConstant.imgManShoesIcon, officeBag: "Shoes"),
      CategoriesgridItemModel(
          manWorkEquipment: ImageConstant.imgManPantsIcon, officeBag: "Pants"),
      CategoriesgridItemModel(
          manWorkEquipment: ImageConstant.imgManUnderwearIcon,
          officeBag: "Underwear")
    ];
  }

  List<Categoriesgrid1ItemModel> fillCategoriesgrid1ItemList() {
    return [
      Categoriesgrid1ItemModel(
          womanTShirtIcon: ImageConstant.imgWomanTShirtIcon, tShirt: "T-Shirt"),
      Categoriesgrid1ItemModel(
          womanTShirtIcon: ImageConstant.imgDressIcon, tShirt: "Dress"),
      Categoriesgrid1ItemModel(
          womanTShirtIcon: ImageConstant.imgWomanPantsIcon, tShirt: "Pants"),
      Categoriesgrid1ItemModel(
          womanTShirtIcon: ImageConstant.imgSkirtIcon, tShirt: "Skirt"),
      Categoriesgrid1ItemModel(
          womanTShirtIcon: ImageConstant.imgWomanBagIcon, tShirt: "Bag"),
      Categoriesgrid1ItemModel(
          womanTShirtIcon: ImageConstant.imgHighHeelsIcon, tShirt: "Heels"),
      Categoriesgrid1ItemModel(
          womanTShirtIcon: ImageConstant.imgBikiniIcon, tShirt: "Bikini")
    ];
  }

  _onInitialize(
    ExploreInitialEvent event,
    Emitter<ExploreState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
    emit(state.copyWith(
        exploreModelObj: state.exploreModelObj?.copyWith(
            categoriesgridItemList: fillCategoriesgridItemList(),
            categoriesgrid1ItemList: fillCategoriesgrid1ItemList())));
  }
}
