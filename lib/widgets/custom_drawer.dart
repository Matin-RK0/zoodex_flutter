import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/blocs/drawer_provider.dart';
import 'package:zoodex/services/icon_getter.dart';
import 'package:zoodex/utils/theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);

    return Stack(
      children: [
        // بلور پس‌زمینه با انیمیشن
        AnimatedContainer(
          duration: Duration(milliseconds: 200), // زمان انیمیشن
          curve: Curves.easeOut, // خروج نرم
          color: drawerProvider.isDrawerOpen
              ? Colors.black.withOpacity(0.3) // هنگام باز بودن دراور
              : Colors.transparent, // هنگام بسته شدن دراور
          child: drawerProvider.isDrawerOpen
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(color: Colors.transparent),
                )
              : null,
        ),

        // محتوای دراور
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 290, // عرض دراور
            child: Drawer(
              backgroundColor: AppTheme.backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF5F6266),
                          size: 26,
                        ),
                        onPressed: () {
                          drawerProvider.closeDrawer();
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  _buildDrawerItem(
                    context,
                    iconUrl: 'https://beta.zoodex.ir/svg/collection-active.svg',
                    title: 'ایجاد مجموعه',
                    onTap: () {
                      drawerProvider.selectItem('ایجاد مجموعه');
                    },
                    isSelected: drawerProvider.selectedItem == 'ایجاد مجموعه',
                  ),
                  _buildDrawerItem(
                    context,
                    iconUrl: 'https://beta.zoodex.ir/svg/courier-active.svg',
                    title: 'ثبت‌نام سفیران',
                    onTap: () {
                      drawerProvider.selectItem('ثبت‌نام سفیران');
                    },
                    isSelected: drawerProvider.selectedItem == 'ثبت‌نام سفیران',
                  ),
                  _buildDrawerItem(
                    context,
                    iconUrl: 'https://beta.zoodex.ir/svg/headphone-active.svg',
                    title: 'پشتیبانی سفارش',
                    onTap: () {
                      drawerProvider.selectItem('پشتیبانی سفارش');
                    },
                    isSelected: drawerProvider.selectedItem == 'پشتیبانی سفارش',
                  ),
                  _buildDrawerItem(
                    context,
                    iconUrl: 'https://beta.zoodex.ir/svg/phone-active.svg',
                    title: 'تماس با ما',
                    onTap: () {
                      drawerProvider.selectItem('تماس با ما');
                    },
                    isSelected: drawerProvider.selectedItem == 'تماس با ما',
                  ),
                  _buildDrawerItem(
                    context,
                    iconUrl:
                        'https://beta.zoodex.ir/svg/mini-logo-outlined.svg',
                    title: 'دانلود اپلیکیشن',
                    onTap: () {
                      drawerProvider.selectItem('دانلود اپلیکیشن');
                    },
                    isSelected:
                        drawerProvider.selectedItem == 'دانلود اپلیکیشن',
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'زودکس را در اینستاگرام دنبال کنید',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w100,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const IconWidget(
                            iconKey: 'instagramIcon',
                            iconUrl:
                                'https://beta.zoodex.ir/svg/instagram-fill.svg',
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required String iconUrl,
    required String title,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return ListTile(
      onTap: onTap,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isSelected ? AppTheme.primaryColor : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
          ),
          const SizedBox(width: 10),
          IconWidget(iconKey: title, iconUrl: iconUrl, size: 30),
        ],
      ),
    );
  }
}
