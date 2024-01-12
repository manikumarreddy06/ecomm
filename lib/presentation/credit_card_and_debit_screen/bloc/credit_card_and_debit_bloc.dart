import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/creditcarditems_item_model.dart';
import 'package:momskart/presentation/credit_card_and_debit_screen/models/credit_card_and_debit_model.dart';
part 'credit_card_and_debit_event.dart';
part 'credit_card_and_debit_state.dart';

/// A bloc that manages the state of a CreditCardAndDebit according to the event that is dispatched to it.
class CreditCardAndDebitBloc
    extends Bloc<CreditCardAndDebitEvent, CreditCardAndDebitState> {
  CreditCardAndDebitBloc(CreditCardAndDebitState initialState)
      : super(initialState) {
    on<CreditCardAndDebitInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CreditCardAndDebitInitialEvent event,
    Emitter<CreditCardAndDebitState> emit,
  ) async {
    emit(state.copyWith(
        creditCardAndDebitModelObj: state.creditCardAndDebitModelObj?.copyWith(
            creditcarditemsItemList: fillCreditcarditemsItemList())));
  }

  List<CreditcarditemsItemModel> fillCreditcarditemsItemList() {
    return [
      CreditcarditemsItemModel(
          debitCardNumber: "6326    9124    8124    9875",
          cardholder: "CARD HOLDER",
          dominicOvo: "Dominic Ovo",
          cardsave: "CARD SAVE",
          debitCardExpiry: "06/24"),
      CreditcarditemsItemModel(
          debitCardNumber: "6326    9124    8124    9875",
          cardholder: "CARD HOLDER",
          dominicOvo: "Dominic Ovo",
          cardsave: "CARD SAVE",
          debitCardExpiry: "06/24")
    ];
  }
}
