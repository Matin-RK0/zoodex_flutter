import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/controllers/banner_controller.dart';
import 'package:zoodex/controllers/location_controller.dart';
import 'package:zoodex/controllers/discount_controller.dart';
import 'package:zoodex/controllers/foods_controller.dart';
import 'package:zoodex/controllers/shops_card_controller.dart';
import 'package:zoodex/controllers/bottom_nav_controller.dart';
import 'package:zoodex/controllers/category_controller.dart';
import 'package:zoodex/controllers/drawer_controller.dart';
import 'package:zoodex/services/icon_getter.dart';
import 'package:zoodex/controllers/parallel_worlds_controller.dart';
import 'package:zoodex/utils/theme.dart';
import 'package:zoodex/pages/main_screen.dart';

class ZoodexApp extends StatelessWidget {
  const ZoodexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IconProvider()),
        ChangeNotifierProvider(
            create: (_) => CategoryController()..fetchCategories()),
        ChangeNotifierProvider(create: (_) => ShopsCardController()),
        ChangeNotifierProvider(create: (_) => CustomDrawerController()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => ParallelWorldsController()),
        ChangeNotifierProvider(create: (_) => DiscountController()),
        ChangeNotifierProvider(create: (_) => FoodsController()),
        ChangeNotifierProvider(create: (_) => BottomNavController()),
        ChangeNotifierProvider(
            create: (context) => BannerProvider()..loadBanners()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Zoodex",
        theme: AppTheme.lightTheme,
        home: MainScreen(),
      ),
    );
  }
}
