// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [conditionchipview_item_widget] screen.
class ConditionchipviewItemModel extends Equatable {
  ConditionchipviewItemModel({
    this.newVar,
    this.isSelected,
  }) {
    newVar = newVar ?? "New";
    isSelected = isSelected ?? false;
  }

  String? newVar;

  bool? isSelected;

  ConditionchipviewItemModel copyWith({
    String? newVar,
    bool? isSelected,
  }) {
    return ConditionchipviewItemModel(
      newVar: newVar ?? this.newVar,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [newVar, isSelected];
}
