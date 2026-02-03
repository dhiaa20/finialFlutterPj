import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exam_flutter/core/constants/app_constants.dart';
import 'package:exam_flutter/features/food/providers/review_provider.dart';
import 'package:exam_flutter/features/food/providers/food_provider.dart';
import 'package:intl/intl.dart';

class MyReviewsPage extends StatelessWidget {
  const MyReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewProvider = context.watch<ReviewProvider>();
    final foodProvider = context.watch<FoodProvider>();
    final reviews = reviewProvider.allUserReviews;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Reviews'),
      ),
      body: reviews.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.rate_review_outlined, size: 64, color: AppConstants.lightText),
                  const SizedBox(height: 16),
                  const Text('You haven\'t written any reviews yet.',
                      style: TextStyle(color: AppConstants.lightText)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                // Find food name (this is a bit inefficient but works for a demo)
                // In a real app, the review model might store the food name too.
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              review.foodName ?? 'Food Item',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              DateFormat('MMM dd, yyyy').format(review.date),
                              style: const TextStyle(color: AppConstants.lightText, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(5, (starIndex) {
                            return Icon(
                              starIndex < review.rating ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                              size: 18,
                            );
                          }),
                        ),
                        const SizedBox(height: 8),
                        Text(review.comment),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
