// lib/controllers/foods_controller.dart
import 'package:flutter/material.dart';
import '../models/food_model.dart';

class FoodsController extends ChangeNotifier {
  final List<Food> _items = [
    Food(
      title: 'برگر',
      iconKey: '',
      iconUrl: 'https://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/burger.png',
    ),
    Food(
      title: 'پیتزا',
      iconKey: '',
      iconUrl: 'https://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/pizza.png',
    ),
    Food(
      title: 'استیک',
      iconKey: '',
      iconUrl: 'https://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/steak.png',
    ),
  ];

  List<Food> get items => _items;

  void addFood(Food newFood) {
    _items.add(newFood);
    notifyListeners();
  }
}
