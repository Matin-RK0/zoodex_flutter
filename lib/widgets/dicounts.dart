import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/blocs/discounts_provider.dart';
import 'package:zoodex/utils/theme.dart';

class Discounts extends StatelessWidget {
  const Discounts({super.key});

  @override
  Widget build(BuildContext context) {
    final dicountsProvider = Provider.of<DicountsProvider>(context);
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16, top: 16),
                child: SizedBox(
                  height: 50,
                  child: dicountsProvider.items.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: dicountsProvider.items.length,
                            itemBuilder: (context, index) {
                              final item = dicountsProvider.items[index];
                              return Container(
                                margin: EdgeInsets.only(left: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: AppTheme.secondryColor,
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8, top: 8, bottom: 8, left: 8),
                                      child: Image.network(
                                        item['iconUrl']!,
                                        alignment: Alignment.centerRight,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            item['title']!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge,
                                          ),
                                          Text(
                                            item['iconKey']!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          ),
                                        ],
                                      ),
                                    )
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
