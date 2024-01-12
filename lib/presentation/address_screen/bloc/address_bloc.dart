import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/addresses_item_model.dart';
import 'package:momskart/presentation/address_screen/models/address_model.dart';
part 'address_event.dart';
part 'address_state.dart';

/// A bloc that manages the state of a Address according to the event that is dispatched to it.
class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc(AddressState initialState) : super(initialState) {
    on<AddressInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AddressInitialEvent event,
    Emitter<AddressState> emit,
  ) async {
    emit(state.copyWith(
        addressModelObj: state.addressModelObj
            ?.copyWith(addressesItemList: fillAddressesItemList())));
  }

  List<AddressesItemModel> fillAddressesItemList() {
    return [
      AddressesItemModel(
          priscekila: "Priscekila",
          address:
              "3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States",
          mobileNo: "+99 1234567890",
          edit: "Edit",
          delete: "Delete"),
      AddressesItemModel(
          priscekila: "Ahmad Khaidir",
          address:
              "3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States",
          mobileNo: "+99 1234567890",
          edit: "Edit",
          delete: "Delete")
    ];
  }
}
