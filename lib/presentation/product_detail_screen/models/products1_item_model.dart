import '../../../core/app_export.dart';

/// This class is used in the [products1_item_widget] screen.
class Products1ItemModel {
  Products1ItemModel({
    this.productPicture,
    this.id,
  }) {
    productPicture = productPicture ?? ImageConstant.imgProductPicture02;
    id = id ?? "";
  }

  String? productPicture;

  String? id;
}
