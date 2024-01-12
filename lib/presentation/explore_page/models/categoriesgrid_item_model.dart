import '../../../core/app_export.dart';

/// This class is used in the [categoriesgrid_item_widget] screen.
class CategoriesgridItemModel {
  CategoriesgridItemModel({
    this.manWorkEquipment,
    this.officeBag,
    this.id,
  }) {
    manWorkEquipment = manWorkEquipment ?? ImageConstant.imgManWorkEquipment;
    officeBag = officeBag ?? "Office Bag";
    id = id ?? "";
  }

  String? manWorkEquipment;

  String? officeBag;

  String? id;
}
