import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/blocs/shops_card_provider.dart';
import 'package:zoodex/widgets/shops_card.dart';

class ShopList extends StatelessWidget {
  const ShopList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShopsCardProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 32),
      child: Column(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "پیشنهادهای ویژه",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 200,
            child: provider.isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.items.length,
                    itemBuilder: (context, index) {
                      return ShopsCard(offer: provider.items[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
