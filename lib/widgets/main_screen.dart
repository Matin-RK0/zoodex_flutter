import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/blocs/bottom_nav_provider.dart';
import 'package:zoodex/pages/home_page.dart';
import 'custom_bottom_nav.dart';

class MainScreen extends StatelessWidget {
  // ignore: unused_field
  final List<Widget> _screens = [
    // ProfileScreen(),
    // CartScreen(),
    HomePage(),
    // ExploreScreen(),
    // OrdersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      body: HomePage(),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
