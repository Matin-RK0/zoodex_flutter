import 'package:flutter/material.dart';

class FoodsProvider extends ChangeNotifier {
  final List<Map<String, String>> _items = [
    {
      'title': 'برگر',
      'iconKey': '',
      'iconUrl': 'https://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/burger.png'
    },
    {
      'title': 'پیتزا',
      'iconKey': '',
      'iconUrl': 'https://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/pizza.png'
    },
    {
      'title': 'استیک',
      'iconKey': '',
      'iconUrl': 'https://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/steak.png'
    },
  ];

  List<Map<String, String>> get items => _items;

  void addFood(Map<String, String> newFood) {
    _items.add(newFood);
    notifyListeners();
  }
}
