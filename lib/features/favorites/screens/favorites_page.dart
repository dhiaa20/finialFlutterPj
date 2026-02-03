import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exam_flutter/core/constants/app_constants.dart';
import 'package:exam_flutter/features/favorites/providers/favorites_provider.dart';
import 'package:exam_flutter/features/food/providers/restaurant_provider.dart';
import 'package:exam_flutter/features/food/providers/food_provider.dart';
import 'package:exam_flutter/features/food/widgets/restaurant_card.dart';
import 'package:exam_flutter/features/food/widgets/food_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Favorites'),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Restaurants'),
              Tab(text: 'Foods'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FavoriteRestaurantsList(),
            FavoriteFoodsList(),
          ],
        ),
      ),
    );
  }
}

class FavoriteRestaurantsList extends StatelessWidget {
  const FavoriteRestaurantsList({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = context.watch<FavoritesProvider>();
    final restaurantProvider = context.watch<RestaurantProvider>();
    final isWideScreen = MediaQuery.of(context).size.width > 600;
    
    final favoriteRestaurants = restaurantProvider.restaurants
        .where((r) => favoritesProvider.isRestaurantFavorite(r.id))
        .toList();

    if (favoriteRestaurants.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 64, color: AppConstants.lightText),
            SizedBox(height: 16),
            Text('No favorite restaurants yet', style: TextStyle(color: AppConstants.lightText)),
          ],
        ),
      );
    }

    return isWideScreen
        ? GridView.builder(
            padding: const EdgeInsets.all(AppConstants.spacing16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9, // Match Home Page grid ratio
              mainAxisSpacing: AppConstants.spacing16,
              crossAxisSpacing: AppConstants.spacing16,
            ),
            itemCount: favoriteRestaurants.length,
            itemBuilder: (context, index) {
              return RestaurantCard(restaurant: favoriteRestaurants[index]);
            },
          )
        : ListView.builder(
            padding: const EdgeInsets.all(AppConstants.spacing16),
            itemCount: favoriteRestaurants.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppConstants.spacing20),
                child: RestaurantCard(restaurant: favoriteRestaurants[index]),
              );
            },
          );
  }
}

class FavoriteFoodsList extends StatelessWidget {
  const FavoriteFoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = context.watch<FavoritesProvider>();
    final foodProvider = context.watch<FoodProvider>();
    final isWideScreen = MediaQuery.of(context).size.width > 600;
    
    // Note: This assumes all foods are loaded in the provider. 
    // In a real app, we might need to fetch specific foods by ID.
    final favoriteFoods = foodProvider.foods
        .where((f) => favoritesProvider.isFoodFavorite(f.id.toString()))
        .toList();

    if (favoriteFoods.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant, size: 64, color: AppConstants.lightText),
            SizedBox(height: 16),
            Text('No favorite foods yet', style: TextStyle(color: AppConstants.lightText)),
          ],
        ),
      );
    }

    return isWideScreen
        ? GridView.builder(
            padding: const EdgeInsets.all(AppConstants.spacing16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.8,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: favoriteFoods.length,
            itemBuilder: (context, index) => FoodCard(food: favoriteFoods[index]),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(AppConstants.spacing16),
            itemCount: favoriteFoods.length,
            itemBuilder: (context, index) => FoodCard(food: favoriteFoods[index]),
          );
  }
}
