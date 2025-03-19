class CategoryModel {
  final String title;
  final int id;
  final String slug;
  final String citySlug;
  final String imagePath;
  final String imageHoverPath;
  final bool isFreeDelivery;

  CategoryModel({
    required this.title,
    required this.id,
    required this.slug,
    required this.citySlug,
    required this.imagePath,
    required this.imageHoverPath,
    required this.isFreeDelivery,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'] as String,
      id: json['id'] as int,
      slug: json['slug'] as String,
      citySlug: json['city_slug'] as String,
      imagePath: json['image_path'] as String,
      imageHoverPath: json['image_hover_path'] as String,
      isFreeDelivery: json['is_free_delivery'] as bool,
    );
  }
}
