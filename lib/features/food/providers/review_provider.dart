import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:exam_flutter/features/food/models/review_model.dart';

class ReviewProvider with ChangeNotifier {
  static const String _storageKey = 'user_reviews';
  final SharedPreferences _prefs;
  Map<int, List<ReviewModel>> _userReviews = {};

  ReviewProvider(this._prefs) {
    _loadReviews();
  }

  Map<int, List<ReviewModel>> get userReviews => _userReviews;

  List<ReviewModel> get allUserReviews {
    final List<ReviewModel> all = [];
    _userReviews.values.forEach((list) => all.addAll(list));
    all.sort((a, b) => b.date.compareTo(a.date));
    return all;
  }

  void _loadReviews() {
    final String? reviewsJson = _prefs.getString(_storageKey);
    if (reviewsJson != null) {
      final Map<String, dynamic> decoded = json.decode(reviewsJson);
      _userReviews = decoded.map((key, value) {
        final List<dynamic> list = value;
        return MapEntry(
          int.parse(key),
          list.map((item) => ReviewModel.fromJson(item)).toList(),
        );
      });
      notifyListeners();
    }
  }

  Future<void> _saveReviews() async {
    final Map<String, dynamic> toEncode = _userReviews.map((key, value) {
      return MapEntry(
        key.toString(),
        value.map((item) => item.toJson()).toList(),
      );
    });
    await _prefs.setString(_storageKey, json.encode(toEncode));
  }

  Future<void> addReview(int foodId, ReviewModel review) async {
    if (!_userReviews.containsKey(foodId)) {
      _userReviews[foodId] = [];
    }
    
    // In this simple implementation, we just add it. 
    // In a real app, we might check if the user already reviewed this item.
    _userReviews[foodId]!.insert(0, review);
    
    await _saveReviews();
    notifyListeners();
  }
}
