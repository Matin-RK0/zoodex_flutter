class ShopsModel{
  final String title;
  final String imageUrl;
  final double rating;
  final int reviews;
  final String location;
  final String deliveryTime;

  ShopsModel({
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
    required this.location,
    required this.deliveryTime,
  });

  factory ShopsModel.fromJson(Map<String, dynamic> json) {
    return ShopsModel(
      title: json['title'],
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      reviews: json['reviews'],
      location: json['location'],
      deliveryTime: json['deliveryTime'],
    );
  }
}
