import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/blocs/parallelwords_provider.dart';
import 'package:zoodex/utils/theme.dart';

class ParallelWorldsWidget extends StatelessWidget {
  const ParallelWorldsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final parallelWords = Provider.of<ParallelWords>(context);

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            color: AppTheme.secondryColor,
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "جهان‌های موازی",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "!تو در جهان‌های دیگه چیا سفارش میدی؟",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 90,
                    child: parallelWords.items.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : Directionality(
                            textDirection: TextDirection.rtl,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: parallelWords.items.length,
                              itemBuilder: (context, index) {
                                final item = parallelWords.items[index];
                                return Container(
                                  width: 90,
                                  height: 90,
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.network(
                                      item['iconUrl']!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(right: 4),
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onPressed: () {
                      print("رفتن به مرحله بعد...");
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back_ios),
                        Text("بزن بریم"),
                      ],
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
}
