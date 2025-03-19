import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/controllers/shops_card_controller.dart';
import 'package:zoodex/views/shop_card_view.dart';

class ShopsCardView extends StatefulWidget {
  final String title;
  final String endpoint;
  final String jsonKey;

  const ShopsCardView(
      {Key? key,
      required this.title,
      required this.endpoint,
      required this.jsonKey})
      : super(key: key);

  @override
  _ShopsCardViewState createState() => _ShopsCardViewState();
}

class _ShopsCardViewState extends State<ShopsCardView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller =
          Provider.of<ShopsCardController>(context, listen: false);
      controller.fetchShops(widget.endpoint, widget.jsonKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ShopsCardController>(context);

    return Column(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: SizedBox(
            height: 290,
            child: controller.isLoading(widget.jsonKey)
                ? const Center(child: CircularProgressIndicator())
                : Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.shops(widget.jsonKey).length,
                      itemBuilder: (context, index) {
                        final shop = controller.shops(widget.jsonKey)[index];
                        return SizedBox(
                          width: 300,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ShopCard(shop: shop),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
