import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/blocs/bottom_nav_provider.dart';
import 'package:zoodex/services/icon_getter.dart';
import 'package:zoodex/utils/theme.dart';

class CustomBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

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
        children: bottomNavProvider.bottoms.map((item) {
          bool isSelected = bottomNavProvider.currentIndex ==
              bottomNavProvider.bottoms.indexOf(item);

          return GestureDetector(
            onTap: () => bottomNavProvider
                .changeIndex(bottomNavProvider.bottoms.indexOf(item)),
            child: Container(
              padding: EdgeInsets.only(top: 2, bottom: 2),
              height: 60,
              width: 80,
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFFECEFF6) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 4,
                  ),
                  
                  IconWidget(
                    iconKey: item['iconKey']!,
                    iconUrl: item['iconUrl']!,
                    size: 28,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['title']!,
                    style: TextStyle(
                      color: isSelected
                          ? AppTheme.primaryColor
                          : Color(0xFFACA9AE),
                      fontSize: 12,
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
