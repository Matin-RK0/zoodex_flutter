import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/controllers/bottom_nav_controller.dart';
import 'package:zoodex/services/icon_getter.dart';
import 'package:zoodex/utils/theme.dart';

class CustomBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomNavController = Provider.of<BottomNavController>(context);

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomNavController.bottoms.map((item) {
          bool isSelected = bottomNavController.currentIndex ==
              bottomNavController.bottoms.indexOf(item);

          return GestureDetector(
            onTap: () => bottomNavController
                .changeIndex(bottomNavController.bottoms.indexOf(item)),
            child: Container(
              padding: const EdgeInsets.only(top: 2, bottom: 2),
              height: 60,
              width: 80,
              decoration: BoxDecoration(
                color:
                    isSelected ? const Color(0xFFECEFF6) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  IconWidget(
                    iconKey: item.iconKey,
                    iconUrl: item.iconUrl,
                    size: 28,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.title,
                    style: TextStyle(
                      color: isSelected
                          ? AppTheme.primaryColor
                          : const Color(0xFFACA9AE),
                      fontSize: isSelected ? 14 : 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
