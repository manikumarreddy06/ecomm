// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [buyingformatchipview_item_widget] screen.
class BuyingformatchipviewItemModel extends Equatable {
  BuyingformatchipviewItemModel({
    this.allListings,
    this.isSelected,
  }) {
    allListings = allListings ?? "All Listings";
    isSelected = isSelected ?? false;
  }

  String? allListings;

  bool? isSelected;

  BuyingformatchipviewItemModel copyWith({
    String? allListings,
    bool? isSelected,
  }) {
    return BuyingformatchipviewItemModel(
      allListings: allListings ?? this.allListings,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [allListings, isSelected];
}
