class ReviewModel {
  final String id;
  final String userName;
  final String? foodName; // Added foodName
  final double rating;
  final String comment;
  final DateTime date;

  ReviewModel({
    required this.id,
    required this.userName,
    this.foodName,
    required this.rating,
    required this.comment,
    required this.date,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      userName: json['userName'],
      foodName: json['foodName'],
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'foodName': foodName,
      'rating': rating,
      'comment': comment,
      'date': date.toIso8601String(),
    };
  }
}
