// ignore_for_file: must_be_immutable

part of 'add_card_bloc.dart';

/// Represents the state of AddCard in the application.
class AddCardState extends Equatable {
  AddCardState({
    this.cardNumberEditTextController,
    this.expirationDateEditTextController,
    this.securityCodeEditTextController,
    this.cardHolderEditTextController,
    this.addCardModelObj,
  });

  TextEditingController? cardNumberEditTextController;

  TextEditingController? expirationDateEditTextController;

  TextEditingController? securityCodeEditTextController;

  TextEditingController? cardHolderEditTextController;

  AddCardModel? addCardModelObj;

  @override
  List<Object?> get props => [
        cardNumberEditTextController,
        expirationDateEditTextController,
        securityCodeEditTextController,
        cardHolderEditTextController,
        addCardModelObj,
      ];
  AddCardState copyWith({
    TextEditingController? cardNumberEditTextController,
    TextEditingController? expirationDateEditTextController,
    TextEditingController? securityCodeEditTextController,
    TextEditingController? cardHolderEditTextController,
    AddCardModel? addCardModelObj,
  }) {
    return AddCardState(
      cardNumberEditTextController:
          cardNumberEditTextController ?? this.cardNumberEditTextController,
      expirationDateEditTextController: expirationDateEditTextController ??
          this.expirationDateEditTextController,
      securityCodeEditTextController:
          securityCodeEditTextController ?? this.securityCodeEditTextController,
      cardHolderEditTextController:
          cardHolderEditTextController ?? this.cardHolderEditTextController,
      addCardModelObj: addCardModelObj ?? this.addCardModelObj,
    );
  }
}
