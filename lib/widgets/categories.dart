import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/blocs/category_provider.dart';
import 'package:zoodex/services/icon_getter.dart';
import 'package:zoodex/utils/theme.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.5),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categoryProvider.categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final item = categoryProvider.categories[index];
            return Container(
              decoration: BoxDecoration(
                color: AppTheme.secondryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconWidget(
                    iconKey: item['iconUrl']!,
                    iconUrl: item['iconUrl']!,
                    size: 50,
                  ),
                  SizedBox(
                    width: 78,
                    child: Text(
                      item['title']!,
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
