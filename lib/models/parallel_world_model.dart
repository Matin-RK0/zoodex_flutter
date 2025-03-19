class ParallelWorld {
  final String title;
  final String iconKey;
  final String iconUrl;

  ParallelWorld({
    required this.title,
    required this.iconKey,
    required this.iconUrl,
  });

  factory ParallelWorld.fromJson(Map<String, dynamic> json) {
    return ParallelWorld(
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
