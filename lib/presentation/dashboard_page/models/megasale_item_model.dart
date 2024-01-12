import '../../../core/app_export.dart';

/// This class is used in the [megasale_item_widget] screen.
class MegasaleItemModel {
  MegasaleItemModel({
    this.image,
    this.mSNikeAirMax,
    this.price,
    this.price1,
    this.offer,
    this.id,
  }) {
    image = image ?? ImageConstant.imgProductImage2;
    mSNikeAirMax = mSNikeAirMax ?? "MS - Nike Air Max 270 React...";
    price = price ?? "299,43";
    price1 = price1 ?? "534,33";
    offer = offer ?? "24% Off";
    id = id ?? "";
  }

  String? image;

  String? mSNikeAirMax;

  String? price;

  String? price1;

  String? offer;

  String? id;
}
