class DimensionsModel {
  final num width;
  final num height;
  final num depth;

  DimensionsModel({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory DimensionsModel.fromJson(Map<String, dynamic> json) {
    return DimensionsModel(
      width: json['width'] as num,
      height: json['height'] as num,
      depth: json['depth'] as num,
    );
  }
}
