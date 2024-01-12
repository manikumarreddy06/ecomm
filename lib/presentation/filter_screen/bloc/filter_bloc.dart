import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/conditionchipview_item_model.dart';
import '../models/buyingformatchipview_item_model.dart';
import '../models/itemlocationchipview_item_model.dart';
import '../models/showonly_item_model.dart';
import 'package:momskart/presentation/filter_screen/models/filter_model.dart';
part 'filter_event.dart';
part 'filter_state.dart';

/// A bloc that manages the state of a Filter according to the event that is dispatched to it.
class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc(FilterState initialState) : super(initialState) {
    on<FilterInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
    on<UpdateChipView1Event>(_updateChipView1);
    on<UpdateChipView2Event>(_updateChipView2);
    on<UpdateChipView3Event>(_updateChipView3);
  }

  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<FilterState> emit,
  ) {
    List<ConditionchipviewItemModel> newList =
        List<ConditionchipviewItemModel>.from(
            state.filterModelObj!.conditionchipviewItemList);
    newList[event.index] =
        newList[event.index].copyWith(isSelected: event.isSelected);
    emit(state.copyWith(
        filterModelObj: state.filterModelObj
            ?.copyWith(conditionchipviewItemList: newList)));
  }

  _updateChipView1(
    UpdateChipView1Event event,
    Emitter<FilterState> emit,
  ) {
    List<BuyingformatchipviewItemModel> newList =
        List<BuyingformatchipviewItemModel>.from(
            state.filterModelObj!.buyingformatchipviewItemList);
    newList[event.index] =
        newList[event.index].copyWith(isSelected: event.isSelected);
    emit(state.copyWith(
        filterModelObj: state.filterModelObj
            ?.copyWith(buyingformatchipviewItemList: newList)));
  }

  _updateChipView2(
    UpdateChipView2Event event,
    Emitter<FilterState> emit,
  ) {
    List<ItemlocationchipviewItemModel> newList =
        List<ItemlocationchipviewItemModel>.from(
            state.filterModelObj!.itemlocationchipviewItemList);
    newList[event.index] =
        newList[event.index].copyWith(isSelected: event.isSelected);
    emit(state.copyWith(
        filterModelObj: state.filterModelObj
            ?.copyWith(itemlocationchipviewItemList: newList)));
  }

  _updateChipView3(
    UpdateChipView3Event event,
    Emitter<FilterState> emit,
  ) {
    List<ShowonlyItemModel> newList =
        List<ShowonlyItemModel>.from(state.filterModelObj!.showonlyItemList);
    newList[event.index] =
        newList[event.index].copyWith(isSelected: event.isSelected);
    emit(state.copyWith(
        filterModelObj:
            state.filterModelObj?.copyWith(showonlyItemList: newList)));
  }

  List<ConditionchipviewItemModel> fillConditionchipviewItemList() {
    return List.generate(3, (index) => ConditionchipviewItemModel());
  }

  List<BuyingformatchipviewItemModel> fillBuyingformatchipviewItemList() {
    return List.generate(5, (index) => BuyingformatchipviewItemModel());
  }

  List<ItemlocationchipviewItemModel> fillItemlocationchipviewItemList() {
    return List.generate(4, (index) => ItemlocationchipviewItemModel());
  }

  List<ShowonlyItemModel> fillShowonlyItemList() {
    return List.generate(11, (index) => ShowonlyItemModel());
  }

  _onInitialize(
    FilterInitialEvent event,
    Emitter<FilterState> emit,
  ) async {
    emit(state.copyWith(
        priceController: TextEditingController(),
        priceController1: TextEditingController()));
    emit(state.copyWith(
        filterModelObj: state.filterModelObj?.copyWith(
            conditionchipviewItemList: fillConditionchipviewItemList(),
            buyingformatchipviewItemList: fillBuyingformatchipviewItemList(),
            itemlocationchipviewItemList: fillItemlocationchipviewItemList(),
            showonlyItemList: fillShowonlyItemList())));
  }
}
