import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/blocs/foods_provider.dart';
import 'package:zoodex/utils/theme.dart';

class Foods extends StatelessWidget {
  const Foods({super.key});

  @override
  Widget build(BuildContext context) {
    final foodsProvider = Provider.of<FoodsProvider>(context);
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16, top: 32),
                child: SizedBox(
                  height: 90,
                  child: foodsProvider.items.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: foodsProvider.items.length,
                            itemBuilder: (context, index) {
                              final item = foodsProvider.items[index];
                              return Container(
                                height: 90,
                                width: 90,
                                margin: EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: AppTheme.secondryColor,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 14, right: 10),
                                      child: Text(
                                        item['title']!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child:
                                              Image.network(item['iconUrl']!),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
