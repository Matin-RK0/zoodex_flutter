import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/blocs/Location_Provider.dart';
import 'package:zoodex/blocs/bottom_nav_provider.dart';
import 'package:zoodex/blocs/category_provider.dart';
import 'package:zoodex/blocs/discounts_provider.dart';
import 'package:zoodex/blocs/drawer_provider.dart';
import 'package:zoodex/blocs/foods_provider.dart';
import 'package:zoodex/blocs/shops_card_provider.dart';
import 'package:zoodex/services/icon_getter.dart';
import 'package:zoodex/blocs/parallelwords_provider.dart';
import 'package:zoodex/utils/theme.dart';
import 'package:zoodex/widgets/main_screen.dart';

class ZoodexApp extends StatelessWidget {
  const ZoodexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IconProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => ParallelWords()),
        ChangeNotifierProvider(create: (_) => DicountsProvider()),
        ChangeNotifierProvider(create: (_) => FoodsProvider()),
        ChangeNotifierProvider(create: (context) => ShopsCardProvider()..fetchShopsCard()),
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
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
