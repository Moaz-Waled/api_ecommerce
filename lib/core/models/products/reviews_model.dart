class ReviewsModel {
  final int rating;
  final String comment;
  final String reviewerName;
  final String reviewerEmail;

  ReviewsModel({
    required this.rating,
    required this.comment,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(
      rating: json['rating'] as int,
      comment: json['comment'] as String,
      reviewerName: json['reviewerName'] as String,
      reviewerEmail: json['reviewerEmail'] as String,
    );
  }
}
