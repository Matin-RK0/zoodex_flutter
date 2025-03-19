class BannerModel {
  final int id;
  final String title;
  final String imageUrl;
  final String? path; 

  BannerModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.path,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image'],
      path: json['url']['path'],
    );
  }
}
