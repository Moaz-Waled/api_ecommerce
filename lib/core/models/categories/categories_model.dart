class CategoriesModel {
  final String slug;
  final String name;
  final String url;

  CategoriesModel({required this.slug, required this.name, required this.url});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      slug: json['slug'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}
