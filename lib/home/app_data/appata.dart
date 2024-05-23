import 'package:flutter/cupertino.dart';
import 'package:nic_test/model/items.dart';

class AppData extends ChangeNotifier {
  Item? data;

  void updateItems(Item items) {
    data = items;
    notifyListeners();
  }
}
