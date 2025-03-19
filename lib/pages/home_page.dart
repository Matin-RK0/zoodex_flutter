import 'package:flutter/material.dart';
import 'package:zoodex/utils/theme.dart';
import 'package:zoodex/views/banner_slider_view.dart';
import 'package:zoodex/views/shops_card_view.dart';
import 'package:zoodex/views/categories_view.dart';
import 'package:zoodex/widgets/custom_appbar.dart';
import 'package:zoodex/views/custom_drawer_view.dart';
import 'package:zoodex/views/discounts_view.dart';
import 'package:zoodex/views/foods_view.dart';
import 'package:zoodex/views/parallel_worlds.dart';
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
              ShopsCardView(
                title: 'پیشنهادات ویژه',
                jsonKey: 'specials',
                endpoint: '/pages/kerman/index?',
              ),
              BannerSlider(),
              Divider(
                thickness: 2,
                color: AppTheme.secondryColor,
              ),
              ShopsCardView(
                title: 'نزدیک ترین به شما',
                jsonKey: 'topNearest',
                endpoint: '/pages/kerman/sections?sections%5B%5D=topNearest',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
