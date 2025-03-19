import 'package:flutter/material.dart';
import '../models/bottom_nav_item.dart';

class BottomNavController extends ChangeNotifier {
  final List<BottomNavItem> _bottoms = [
    BottomNavItem(
      title: 'پروفایل',
      iconKey: 'پروفایل',
      iconUrl: 'https://beta.zoodex.ir/svg/user-outline-gray.svg',
    ),
    BottomNavItem(
      title: 'سبد خرید',
      iconKey: 'سبد خرید',
      iconUrl: 'https://beta.zoodex.ir/svg/cart-outline-gray.svg',
    ),
    BottomNavItem(
      title: 'خانه',
      iconKey: 'خانه',
      iconUrl: 'https://beta.zoodex.ir/svg/home-outline-gray.svg',
    ),
    BottomNavItem(
      title: 'اکسپلور',
      iconKey: 'اکسپلور',
      iconUrl: 'https://beta.zoodex.ir/svg/explore-outline-gray.svg',
    ),
    BottomNavItem(
      title: 'سفارشات',
      iconKey: 'سفارشات',
      iconUrl: 'https://beta.zoodex.ir/svg/orders-outline-gray.svg',
    ),
  ];
  
  int _currentIndex = 2;

  int get currentIndex => _currentIndex;
  List<BottomNavItem> get bottoms => _bottoms;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void addBottom(BottomNavItem newBottom) {
    _bottoms.add(newBottom);
    notifyListeners();
  }
}
