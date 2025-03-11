import 'package:flutter/material.dart';

class DicountsProvider extends ChangeNotifier {
  final List<Map<String, String>> _items = [
    {
      'title': 'زودکس پلاس',
      'iconKey': 'تخفیف و ارسال رایگان',
      'iconUrl':
          'https://beta.zoodex.ir/image/plus-feature.png'
    },
    {
      'title': 'فود پارتی',
      'iconKey': 'با تخفیف بخر',
      'iconUrl':
          'https://beta.zoodex.ir/image/food-party-feature.png'
    },
    {
      'title': 'کش بک',
      'iconKey': 'خریدت برگشت داره',
      'iconUrl':
          'https://beta.zoodex.ir/image/cashback-feature.png'
    },
  ];

  List<Map<String, String>> get items => _items;

  void addDiscount(Map<String, String> newDiscount) {
    _items.add(newDiscount);
    notifyListeners();
  }
}
