import '../../../core/app_export.dart';

/// This class is used in the [productlist_item_widget] screen.
class ProductlistItemModel {
  ProductlistItemModel({
    this.image,
    this.nikeAirZoomPegasus,
    this.image1,
    this.price,
    this.one,
    this.id,
  }) {
    image = image ?? ImageConstant.imgImageProduct;
    nikeAirZoomPegasus = nikeAirZoomPegasus ?? "Nike Air Zoom Pegasus 36 Miami";
    image1 = image1 ?? ImageConstant.imgLoveIconPink300;
    price = price ?? "299,43";
    one = one ?? "1";
    id = id ?? "";
  }

  String? image;

  String? nikeAirZoomPegasus;

  String? image1;

  String? price;

  String? one;

  String? id;
}
