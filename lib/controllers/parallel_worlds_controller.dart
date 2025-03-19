import 'package:flutter/material.dart';
import 'package:zoodex/models/parallel_world_model.dart';

class ParallelWorldsController extends ChangeNotifier {
  final List<ParallelWorld> _items = [
    ParallelWorld(
      title: 'majerajo',
      iconKey: 'majerajo',
      iconUrl:
          'https://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/recommender/majerajo.jpg',
    ),
    ParallelWorld(
      title: 'lakchery',
      iconKey: 'lakchery',
      iconUrl:
          'https://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/recommender/lakchery.jpg',
    ),
    ParallelWorld(
      title: 'daneshjo',
      iconKey: 'daneshjo',
      iconUrl:
          'https://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/recommender/daneshjo.jpg',
    ),
    ParallelWorld(
      title: 'ashpaz',
      iconKey: 'ashpaz',
      iconUrl:
          'https://s3.ir-thr-at1.arvanstorage.ir/zoodex-cdn/recommender/ashpaz.jpg',
    ),
  ];

  List<ParallelWorld> get items => _items;

  void addItem(ParallelWorld newItem) {
    _items.add(newItem);
    notifyListeners();
  }
}
