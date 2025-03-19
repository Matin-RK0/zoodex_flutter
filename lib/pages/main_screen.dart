import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/controllers/bottom_nav_controller.dart';
import 'package:zoodex/pages/home_page.dart';
import '../views/custom_bottom_nav_view.dart';

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
    final bottomNavProvider = Provider.of<BottomNavController>(context);

    return Scaffold(
      body: HomePage(),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
