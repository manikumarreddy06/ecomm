// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'creditcarditems_item_model.dart';

/// This class defines the variables used in the [credit_card_and_debit_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CreditCardAndDebitModel extends Equatable {
  CreditCardAndDebitModel({this.creditcarditemsItemList = const []}) {}

  List<CreditcarditemsItemModel> creditcarditemsItemList;

  CreditCardAndDebitModel copyWith(
      {List<CreditcarditemsItemModel>? creditcarditemsItemList}) {
    return CreditCardAndDebitModel(
      creditcarditemsItemList:
          creditcarditemsItemList ?? this.creditcarditemsItemList,
    );
  }

  @override
  List<Object?> get props => [creditcarditemsItemList];
}
