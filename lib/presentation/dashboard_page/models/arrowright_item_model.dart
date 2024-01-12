import '../../../core/app_export.dart';

/// This class is used in the [arrowright_item_widget] screen.
class ArrowrightItemModel {
  ArrowrightItemModel({
    this.arrowRight,
    this.manShirt,
    this.id,
  }) {
    arrowRight = arrowRight ?? ImageConstant.imgArrowRight;
    manShirt = manShirt ?? "Man Shirt";
    id = id ?? "";
  }

  String? arrowRight;

  String? manShirt;

  String? id;
}
