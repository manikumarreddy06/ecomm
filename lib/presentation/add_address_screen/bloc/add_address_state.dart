// ignore_for_file: must_be_immutable

part of 'add_address_bloc.dart';

/// Represents the state of AddAddress in the application.
class AddAddressState extends Equatable {
  AddAddressState({
    this.countryEditTextController,
    this.firstNameEditTextController,
    this.lastNameEditTextController,
    this.streetAddressEditTextController,
    this.streetAddressTwoEditTextController,
    this.cityEditTextController,
    this.oldPasswordEditTextController,
    this.zipCodeEditTextController,
    this.phoneNumberEditTextController,
    this.addAddressModelObj,
  });

  TextEditingController? countryEditTextController;

  TextEditingController? firstNameEditTextController;

  TextEditingController? lastNameEditTextController;

  TextEditingController? streetAddressEditTextController;

  TextEditingController? streetAddressTwoEditTextController;

  TextEditingController? cityEditTextController;

  TextEditingController? oldPasswordEditTextController;

  TextEditingController? zipCodeEditTextController;

  TextEditingController? phoneNumberEditTextController;

  AddAddressModel? addAddressModelObj;

  @override
  List<Object?> get props => [
        countryEditTextController,
        firstNameEditTextController,
        lastNameEditTextController,
        streetAddressEditTextController,
        streetAddressTwoEditTextController,
        cityEditTextController,
        oldPasswordEditTextController,
        zipCodeEditTextController,
        phoneNumberEditTextController,
        addAddressModelObj,
      ];
  AddAddressState copyWith({
    TextEditingController? countryEditTextController,
    TextEditingController? firstNameEditTextController,
    TextEditingController? lastNameEditTextController,
    TextEditingController? streetAddressEditTextController,
    TextEditingController? streetAddressTwoEditTextController,
    TextEditingController? cityEditTextController,
    TextEditingController? oldPasswordEditTextController,
    TextEditingController? zipCodeEditTextController,
    TextEditingController? phoneNumberEditTextController,
    AddAddressModel? addAddressModelObj,
  }) {
    return AddAddressState(
      countryEditTextController:
          countryEditTextController ?? this.countryEditTextController,
      firstNameEditTextController:
          firstNameEditTextController ?? this.firstNameEditTextController,
      lastNameEditTextController:
          lastNameEditTextController ?? this.lastNameEditTextController,
      streetAddressEditTextController: streetAddressEditTextController ??
          this.streetAddressEditTextController,
      streetAddressTwoEditTextController: streetAddressTwoEditTextController ??
          this.streetAddressTwoEditTextController,
      cityEditTextController:
          cityEditTextController ?? this.cityEditTextController,
      oldPasswordEditTextController:
          oldPasswordEditTextController ?? this.oldPasswordEditTextController,
      zipCodeEditTextController:
          zipCodeEditTextController ?? this.zipCodeEditTextController,
      phoneNumberEditTextController:
          phoneNumberEditTextController ?? this.phoneNumberEditTextController,
      addAddressModelObj: addAddressModelObj ?? this.addAddressModelObj,
    );
  }
}
