import 'package:flutter/material.dart';
import 'package:zoodex/services/model.dart';

class ShopsCard extends StatelessWidget {
  final ShopsModel offer;

  const ShopsCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, 
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              offer.imageUrl,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offer.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 18),
                    Text("${offer.rating} (${offer.reviews} نظر)"),
                  ],
                ),
                Text(offer.location, style: TextStyle(color: Colors.grey)),
                Text("زمان ارسال: ${offer.deliveryTime}", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
