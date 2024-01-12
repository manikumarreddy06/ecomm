import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:momskart/presentation/add_address_screen/models/add_address_model.dart';
part 'add_address_event.dart';
part 'add_address_state.dart';

/// A bloc that manages the state of a AddAddress according to the event that is dispatched to it.
class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  AddAddressBloc(AddAddressState initialState) : super(initialState) {
    on<AddAddressInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AddAddressInitialEvent event,
    Emitter<AddAddressState> emit,
  ) async {
    emit(state.copyWith(
        countryEditTextController: TextEditingController(),
        firstNameEditTextController: TextEditingController(),
        lastNameEditTextController: TextEditingController(),
        streetAddressEditTextController: TextEditingController(),
        streetAddressTwoEditTextController: TextEditingController(),
        cityEditTextController: TextEditingController(),
        oldPasswordEditTextController: TextEditingController(),
        zipCodeEditTextController: TextEditingController(),
        phoneNumberEditTextController: TextEditingController()));
  }
}
