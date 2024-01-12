// ignore_for_file: must_be_immutable

part of 'search_result_no_data_found_bloc.dart';

/// Represents the state of SearchResultNoDataFound in the application.
class SearchResultNoDataFoundState extends Equatable {
  SearchResultNoDataFoundState({
    this.searchController,
    this.selectedDropDownValue,
    this.searchResultNoDataFoundModelObj,
  });

  TextEditingController? searchController;

  SelectionPopupModel? selectedDropDownValue;

  SearchResultNoDataFoundModel? searchResultNoDataFoundModelObj;

  @override
  List<Object?> get props => [
        searchController,
        selectedDropDownValue,
        searchResultNoDataFoundModelObj,
      ];
  SearchResultNoDataFoundState copyWith({
    TextEditingController? searchController,
    SelectionPopupModel? selectedDropDownValue,
    SearchResultNoDataFoundModel? searchResultNoDataFoundModelObj,
  }) {
    return SearchResultNoDataFoundState(
      searchController: searchController ?? this.searchController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      searchResultNoDataFoundModelObj: searchResultNoDataFoundModelObj ??
          this.searchResultNoDataFoundModelObj,
    );
  }
}
