import '../../../core/app_export.dart';

/// This class is used in the [categoriesgrid1_item_widget] screen.
class Categoriesgrid1ItemModel {
  Categoriesgrid1ItemModel({
    this.womanTShirtIcon,
    this.tShirt,
    this.id,
  }) {
    womanTShirtIcon = womanTShirtIcon ?? ImageConstant.imgWomanTShirtIcon;
    tShirt = tShirt ?? "T-Shirt";
    id = id ?? "";
  }

  String? womanTShirtIcon;

  String? tShirt;

  String? id;
}
