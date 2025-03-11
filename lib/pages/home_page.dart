import 'package:flutter/material.dart';
import 'package:zoodex/widgets/shop_lists.dart';
import 'package:zoodex/widgets/categories.dart';
import 'package:zoodex/widgets/custom_appbar.dart';
import 'package:zoodex/widgets/custom_drawer.dart';
import 'package:zoodex/widgets/dicounts.dart';
import 'package:zoodex/widgets/foods.dart';
import 'package:zoodex/widgets/parallel_worlds.dart';
import 'package:zoodex/widgets/search_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        endDrawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchBox(),
              Categories(),
              ParallelWorldsWidget(),
              Discounts(),
              Foods(),
              ShopList(),
            ],
          ),
        ),
      ),
    );
  }
}
