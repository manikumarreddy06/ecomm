import '../../../core/app_export.dart';

/// This class is used in the [creditcarditems_item_widget] screen.
class CreditcarditemsItemModel {
  CreditcarditemsItemModel({
    this.debitCardNumber,
    this.cardholder,
    this.dominicOvo,
    this.cardsave,
    this.debitCardExpiry,
    this.id,
  }) {
    debitCardNumber = debitCardNumber ?? "6326    9124    8124    9875";
    cardholder = cardholder ?? "CARD HOLDER";
    dominicOvo = dominicOvo ?? "Dominic Ovo";
    cardsave = cardsave ?? "CARD SAVE";
    debitCardExpiry = debitCardExpiry ?? "06/24";
    id = id ?? "";
  }

  String? debitCardNumber;

  String? cardholder;

  String? dominicOvo;

  String? cardsave;

  String? debitCardExpiry;

  String? id;
}
