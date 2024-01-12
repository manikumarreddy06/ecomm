import '../../../core/app_export.dart';

/// This class is used in the [favoriteproduct_item_widget] screen.
class FavoriteproductItemModel {
  FavoriteproductItemModel({
    this.image,
    this.nikeAirMaxReact,
    this.price,
    this.price1,
    this.offer,
    this.id,
  }) {
    image = image ?? ImageConstant.imgProductImage2;
    nikeAirMaxReact = nikeAirMaxReact ?? "Nike Air Max 270 React ENG";
    price = price ?? "299,43";
    price1 = price1 ?? "534,33";
    offer = offer ?? "24% Off";
    id = id ?? "";
  }

  String? image;

  String? nikeAirMaxReact;

  String? price;

  String? price1;

  String? offer;

  String? id;
}
