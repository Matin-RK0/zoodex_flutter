import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  final List<Map<String, String>> _categories = [
    {
      'title': 'کافی شاپ',
      'iconKey': 'cafe',
      'iconUrl':
          'http://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/vendor-types/cafe.png'
    },
    {
      'title': 'سوپرمارکت',
      'iconKey': 'supermarket',
      'iconUrl':
          'http://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/vendor-types/supermarket.png'
    },
    {
      'title': 'فست فود',
      'iconKey': 'fastfood',
      'iconUrl':
          'http://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/vendor-types/fastfood.png'
    },
    {
      'title': 'رستوران',
      'iconKey': 'restaurant',
      'iconUrl':
          'http://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/vendor-types/resturant.png'
    },
    {
      'title': 'آبمیوه و بستنی',
      'iconKey': 'icecream',
      'iconUrl':
          'http://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/vendor-types/fruitjuice.png'
    },
    {
      'title': 'شکلات و شیرینی',
      'iconKey': 'sweets',
      'iconUrl':
          'http://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/vendor-types/chocolate.png'
    },
    {
      'title': 'میوه و سبزیجات',
      'iconKey': 'fruit',
      'iconUrl':
          'http://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/vendor-types/fruits.png'
    },
    {
      'title': 'نانوایی',
      'iconKey': 'bakery',
      'iconUrl':
          'http://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/vendor-types/bakery.png'
    },
    {
      'title': 'لوازم آرایشی',
      'iconKey': 'cosmetic',
      'iconUrl':
          'http://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/vendor-types/arayeshibehdashti.png'
    },
    {
      'title': 'عطاری و خشکبار',
      'iconKey': 'spices',
      'iconUrl':
          'http://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/vendor-types/Spicesandseasonings.png'
    },
    {
      'title': 'گوشت و مرغ',
      'iconKey': 'meat',
      'iconUrl':
          'http://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/vendor-types/morghvgosht.png'
    },
    {
      'title': 'سایر',
      'iconKey': 'more',
      'iconUrl': 'https://beta.zoodex.ir/svg/more.svg'
    },
  ];

  List<Map<String, String>> get categories => _categories;

  void addCategory(Map<String, String> newCategory) {
    _categories.add(newCategory);
    notifyListeners();
  }
}
