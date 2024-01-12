import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/searchresult_item_model.dart';
import 'package:momskart/presentation/search_result_screen/models/search_result_model.dart';
part 'search_result_event.dart';
part 'search_result_state.dart';

/// A bloc that manages the state of a SearchResult according to the event that is dispatched to it.
class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  SearchResultBloc(SearchResultState initialState) : super(initialState) {
    on<SearchResultInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<SearchResultState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue: event.value));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  List<SearchresultItemModel> fillSearchresultItemList() {
    return [
      SearchresultItemModel(
          image: ImageConstant.imgProductImage1,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      SearchresultItemModel(
          image: ImageConstant.imgImageProduct,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      SearchresultItemModel(
          image: ImageConstant.imgProductImage,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      SearchresultItemModel(
          image: ImageConstant.imgProductImage3,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      SearchresultItemModel(
          image: ImageConstant.imgImageProduct,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off"),
      SearchresultItemModel(
          image: ImageConstant.imgProductImage1,
          nikeAirMaxReact: "Nike Air Max 270 React ENG",
          price: "299,43",
          price1: "534,33",
          offer: "24% Off")
    ];
  }

  _onInitialize(
    SearchResultInitialEvent event,
    Emitter<SearchResultState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
    emit(state.copyWith(
        searchResultModelObj: state.searchResultModelObj?.copyWith(
            dropdownItemList: fillDropdownItemList(),
            searchresultItemList: fillSearchresultItemList())));
  }
}
