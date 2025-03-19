// views/banner_slider.dart
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/controllers/banner_controller.dart'; // یا BannerProvider
import 'package:zoodex/utils/theme.dart';

class BannerSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BannerProvider>(
      builder: (context, bannerProvider, child) {
        if (bannerProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (bannerProvider.banners.isEmpty) {
          return const Center(child: Text("بنری موجود نیست."));
        }
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: CarouselSlider(
            items: bannerProvider.banners.map((banner) {
              return GestureDetector(
                onTap: () {
                  // بررسی اینکه مسیر بنر موجود است یا نه
                  if (banner.path != null && banner.path!.isNotEmpty) {
                    Navigator.pushNamed(context, banner.path!);
                  } else {
                    print("مسیر برای این بنر تعریف نشده است.");
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    banner.imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppTheme.secondryColor,
                        child: const Icon(Icons.error, color: Colors.red),
                      );
                    },
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 200,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              viewportFraction: 1,
              autoPlay: true,
            ),
          ),
        );
      },
    );
  }
}
