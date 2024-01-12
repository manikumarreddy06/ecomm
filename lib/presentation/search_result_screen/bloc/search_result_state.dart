// ignore_for_file: must_be_immutable

part of 'search_result_bloc.dart';

/// Represents the state of SearchResult in the application.
class SearchResultState extends Equatable {
  SearchResultState({
    this.searchController,
    this.selectedDropDownValue,
    this.searchResultModelObj,
  });

  TextEditingController? searchController;

  SelectionPopupModel? selectedDropDownValue;

  SearchResultModel? searchResultModelObj;

  @override
  List<Object?> get props => [
        searchController,
        selectedDropDownValue,
        searchResultModelObj,
      ];
  SearchResultState copyWith({
    TextEditingController? searchController,
    SelectionPopupModel? selectedDropDownValue,
    SearchResultModel? searchResultModelObj,
  }) {
    return SearchResultState(
      searchController: searchController ?? this.searchController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      searchResultModelObj: searchResultModelObj ?? this.searchResultModelObj,
    );
  }
}
