// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [itemlocationchipview_item_widget] screen.
class ItemlocationchipviewItemModel extends Equatable {
  ItemlocationchipviewItemModel({
    this.uSOnly,
    this.isSelected,
  }) {
    uSOnly = uSOnly ?? "US Only";
    isSelected = isSelected ?? false;
  }

  String? uSOnly;

  bool? isSelected;

  ItemlocationchipviewItemModel copyWith({
    String? uSOnly,
    bool? isSelected,
  }) {
    return ItemlocationchipviewItemModel(
      uSOnly: uSOnly ?? this.uSOnly,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [uSOnly, isSelected];
}
