import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/controllers/category_controller.dart';
import 'package:zoodex/services/icon_getter.dart';
import 'package:zoodex/utils/theme.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Provider.of<CategoryController>(context);
    final categories = categoryController.categories;

    if (categories.isEmpty) {
      return const Center(
          child: SizedBox(
        height: 365,
      ));
    }

    final limitedCategories =
        categories.length > 11 ? categories.sublist(0, 11) : categories;

    return Padding(
      padding: const EdgeInsets.all(16.5),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 12,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            if (index == 11) {
              return GestureDetector(
                onTap: () {
                  print("دکمه اضافه شدن کلیک شد!");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.secondryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const IconWidget(
                        iconKey: 'iconKey',
                        iconUrl: 'https://zoodex.ir/svg/more.svg',
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'بیشتر',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            }

            final category = limitedCategories[index];
            return Container(
              decoration: BoxDecoration(
                color: AppTheme.secondryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    category.imagePath,
                    width: 60,
                    height: 60,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.error,
                        color: Colors.red,
                      );
                    },
                  ),
                  SizedBox(
                    width: 78,
                    child: Text(
                      category.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
