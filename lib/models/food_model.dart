class Food {
  final String title;
  final String iconKey;
  final String iconUrl;

  Food({
    required this.title,
    required this.iconKey,
    required this.iconUrl,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      title: json['title'] as String,
      iconKey: json['iconKey'] as String,
      iconUrl: json['iconUrl'] as String,
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
