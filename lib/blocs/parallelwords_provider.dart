import 'package:flutter/material.dart';

class ParallelWords extends ChangeNotifier {
  final List<Map<String, String>> _items = [
    {
      'title': 'majerajo',
      'iconKey': 'majerajo',
      'iconUrl':
          'https://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/recommender/majerajo.jpg'
    },
    {
      'title': 'lakchery',
      'iconKey': 'lakchery',
      'iconUrl':
          'https://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/recommender/lakchery.jpg'
    },
    {
      'title': 'daneshjo',
      'iconKey': 'daneshjo',
      'iconUrl':
          'https://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/recommender/daneshjo.jpg'
    },
    {
      'title': 'ashpaz',
      'iconKey': 'ashpaz',
      'iconUrl':
          'https://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/recommender/ashpaz.jpg'
    },
  ];

  List<Map<String, String>> get items => _items;

  void addItem(Map<String, String> newItem) {
    _items.add(newItem);
    notifyListeners();
  }
}
