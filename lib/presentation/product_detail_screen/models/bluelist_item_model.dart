import '../../../core/app_export.dart';

/// This class is used in the [bluelist_item_widget] screen.
class BluelistItemModel {
  BluelistItemModel({this.id}) {
    id = id ?? "";
  }

  String? id;
}
