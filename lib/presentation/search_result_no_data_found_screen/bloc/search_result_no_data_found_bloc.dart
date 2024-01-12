import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:momskart/presentation/search_result_no_data_found_screen/models/search_result_no_data_found_model.dart';
part 'search_result_no_data_found_event.dart';
part 'search_result_no_data_found_state.dart';

/// A bloc that manages the state of a SearchResultNoDataFound according to the event that is dispatched to it.
class SearchResultNoDataFoundBloc
    extends Bloc<SearchResultNoDataFoundEvent, SearchResultNoDataFoundState> {
  SearchResultNoDataFoundBloc(SearchResultNoDataFoundState initialState)
      : super(initialState) {
    on<SearchResultNoDataFoundInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<SearchResultNoDataFoundState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  _onInitialize(
    SearchResultNoDataFoundInitialEvent event,
    Emitter<SearchResultNoDataFoundState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
    ));
    emit(state.copyWith(
        searchResultNoDataFoundModelObj:
            state.searchResultNoDataFoundModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
    )));
  }
}
