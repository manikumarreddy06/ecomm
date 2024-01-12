import '../../../core/app_export.dart';

/// This class is used in the [flashsale_item_widget] screen.
class FlashsaleItemModel {
  FlashsaleItemModel({
    this.image,
    this.fSNikeAirMax,
    this.price,
    this.price1,
    this.offer,
    this.id,
  }) {
    image = image ?? ImageConstant.imgProductImage;
    fSNikeAirMax = fSNikeAirMax ?? "FS - Nike Air Max 270 React...";
    price = price ?? "299,43";
    price1 = price1 ?? "534,33";
    offer = offer ?? "24% Off";
    id = id ?? "";
  }

  String? image;

  String? fSNikeAirMax;

  String? price;

  String? price1;

  String? offer;

  String? id;
}
