class Discount {
  final String title;
  final String iconKey;
  final String iconUrl;

  Discount({
    required this.title,
    required this.iconKey,
    required this.iconUrl,
  });

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      title: json['title'],
      iconKey: json['iconKey'],
      iconUrl: json['iconUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'iconKey': iconKey,
      'iconUrl': iconUrl,
    };
  }
}
