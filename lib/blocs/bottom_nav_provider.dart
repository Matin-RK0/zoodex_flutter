import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier {
  final List<Map<String, String>> _bottoms = [
    {
      'title': 'پروفایل',
      'iconKey': 'پروفایل',
      'iconUrl': 'https://beta.zoodex.ir/svg/user-outline-gray.svg'
    },
    {
      'title': 'سبد خرید',
      'iconKey': 'سبد خرید',
      'iconUrl': 'https://beta.zoodex.ir/svg/cart-outline-gray.svg'
    },
    {
      'title': 'خانه',
      'iconKey': 'خانه',
      'iconUrl': 'https://beta.zoodex.ir/svg/home-outline-gray.svg'
    },
    {
      'title': 'اکسپلور',
      'iconKey': 'اکسپلور',
      'iconUrl': 'https://beta.zoodex.ir/svg/explore-outline-gray.svg'
    },
    {
      'title': 'سفارشات',
      'iconKey': 'سفارشات',
      'iconUrl': 'https://beta.zoodex.ir/svg/orders-outline-gray.svg'
    },
  ];
  int _currentIndex = 2;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<Map<String, String>> get bottoms => _bottoms;

  void newBottoms(Map<String, String> newBottoms) {
    _bottoms.add(newBottoms);
    notifyListeners();
  }
}
