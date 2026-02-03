import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exam_flutter/core/constants/app_constants.dart';
import 'package:exam_flutter/features/food/providers/food_provider.dart';
import 'package:exam_flutter/features/food/widgets/food_card.dart';

class PopularFoodsPage extends StatelessWidget {
  const PopularFoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final foodProvider = context.watch<FoodProvider>();
    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Foods'),
      ),
      body: foodProvider.isLoading && foodProvider.popularFoods.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : foodProvider.popularFoods.isEmpty
              ? const Center(child: Text('No popular food items found.'))
              : isLargeScreen
                  ? GridView.builder(
                      padding: const EdgeInsets.all(AppConstants.spacing16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: foodProvider.popularFoods.length,
                      itemBuilder: (context, index) => FoodCard(food: foodProvider.popularFoods[index]),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(AppConstants.spacing16),
                      itemCount: foodProvider.popularFoods.length,
                      itemBuilder: (context, index) => FoodCard(food: foodProvider.popularFoods[index]),
                    ),
    );
  }
}
