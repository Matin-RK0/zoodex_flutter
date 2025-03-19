import 'package:flutter/material.dart';
import '../models/discount_model.dart';

class DiscountController extends ChangeNotifier {
  final List<Discount> _items = [
    Discount(
      title: 'زودکس پلاس',
      iconKey: 'تخفیف و ارسال رایگان',
      iconUrl: 'https://beta.zoodex.ir/image/plus-feature.png',
    ),
    Discount(
      title: 'فود پارتی',
      iconKey: 'با تخفیف بخر',
      iconUrl: 'https://beta.zoodex.ir/image/food-party-feature.png',
    ),
    Discount(
      title: 'کش بک',
      iconKey: 'خریدت برگشت داره',
      iconUrl: 'https://beta.zoodex.ir/image/cashback-feature.png',
    ),
  ];

  List<Discount> get items => _items;

  void addDiscount(Discount newDiscount) {
    _items.add(newDiscount);
    notifyListeners();
  }
}
