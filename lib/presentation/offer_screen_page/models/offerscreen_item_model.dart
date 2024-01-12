import '../../../core/app_export.dart';

/// This class is used in the [offerscreen_item_widget] screen.
class OfferscreenItemModel {
  OfferscreenItemModel({
    this.image,
    this.offer,
    this.hours,
    this.text,
    this.minutes,
    this.text1,
    this.secounds,
    this.id,
  }) {
    image = image ?? ImageConstant.imgPromotionImage;
    offer = offer ?? "Super Flash Sale\n50% Off";
    hours = hours ?? "08";
    text = text ?? ":";
    minutes = minutes ?? "34";
    text1 = text1 ?? ":";
    secounds = secounds ?? "52";
    id = id ?? "";
  }

  String? image;

  String? offer;

  String? hours;

  String? text;

  String? minutes;

  String? text1;

  String? secounds;

  String? id;
}
