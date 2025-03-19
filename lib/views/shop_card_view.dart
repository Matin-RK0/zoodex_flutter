import 'package:flutter/material.dart';
import 'package:zoodex/models/shops_model.dart';
import 'package:zoodex/services/icon_getter.dart';
import 'package:zoodex/utils/theme.dart';

class ShopCard extends StatelessWidget {
  final ShopsModel shop;

  const ShopCard({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundMobile =
        shop.backgroundMobile ?? 'https://via.placeholder.com/300x160';
    final vendorType = shop.vendorType ?? 'default';

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // تصویر فروشگاه با برچسب "پیش سفارش"
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  backgroundMobile,
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 160,
                      color: Colors.grey,
                      child: const Icon(Icons.error),
                    );
                  },
                ),
              ),
              if (shop.status == 'PREORDER') ...[
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'پیش سفارش',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              ],
              Positioned(
                top: 135,
                left: 6,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: shop.plus != null && shop.plus!.status == 1
                          ? Colors.amber
                          : AppTheme.searchBoxText,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: shop.logo?.isNotEmpty == true
                        ? Image.network(
                            shop.logo ?? 'https://via.placeholder.com/50',
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/ph-$vendorType.png',
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.error);
                                },
                              );
                            },
                          )
                        : Image.asset(
                            'assets/images/ph-$vendorType.png',
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error);
                            },
                          ),
                  ),
                ),
              ),
              if (shop.plus != null && shop.plus!.status == 1) ...[
                Positioned(
                  top: 172,
                  left: 45,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.amber),
                    child: Image.asset(
                      'assets/images/star-fill-yellow.png',
                      color: AppTheme.backgroundColor,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error, size: 16);
                      },
                    ),
                  ),
                )
              ],
            ],
          ),
          // محتوا
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // نام فروشگاه
                Text(
                  shop.title ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                // امتیاز و عملکرد
                Row(
                  children: [
                    if (shop.rate != null && shop.rate! > 0) ...[
                      Icon(Icons.star, color: Colors.yellow[700], size: 16),
                      const SizedBox(width: 4),
                      Text('${shop.rate}',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ] else ...[
                      Icon(Icons.star,
                          color: const Color(0xFFACA9AE), size: 16),
                    ],
                    const SizedBox(width: 2),
                    Text(
                      '(${shop.point ?? 0} امتیاز عملکرد)',
                      style: const TextStyle(
                          color: Color(0xFFACA9AE), fontSize: 14),
                    ),
                    const SizedBox(width: 6),
                    if (shop.offer != null && shop.offer! != 0) ...[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.red[600],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'تا ${shop.offer}%',
                          style: TextStyle(color: AppTheme.backgroundColor),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                // آدرس و زمان تحویل
                Padding(
                  padding: const EdgeInsets.only(left: 75),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          shop.miniAddress ?? '',
                          style: const TextStyle(
                            color: Color(0xFFACA9AE),
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '| ${shop.avgTime ?? 0} دقیقه',
                        style: const TextStyle(
                          color: Color(0xFFACA9AE),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // ارسال رایگان و تخفیف پلاس
                if (shop.plus != null && shop.plus!.status == 1) ...[
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.amber[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconWidget(
                          iconKey: 'sparkle',
                          iconUrl: 'https://zoodex.ir/svg/sparkle.svg',
                          size: 20,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          shop.plus!.title ?? '',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
