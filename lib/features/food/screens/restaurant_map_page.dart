import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exam_flutter/core/constants/app_constants.dart';
import 'package:exam_flutter/features/food/providers/restaurant_provider.dart';
import 'package:exam_flutter/features/food/models/restaurant_model.dart';

class RestaurantMapPage extends StatelessWidget {
  const RestaurantMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Locations'),
      ),
      body: Consumer<RestaurantProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Stack(
            children: [
              // Real Map Background
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/mapsGoogle1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  color: Colors.black.withValues(alpha: 0.1), // Subtle overlay for better contrast
                ),
              ),

              // Simulated Markers
              ...provider.restaurants.map((restaurant) {
                // Randomly position markers for simulation
                final top = 100.0 + (restaurant.id.hashCode % 500);
                final left = 40.0 + (restaurant.id.hashCode % 320);

                return Positioned(
                  top: top,
                  left: left,
                  child: GestureDetector(
                    onTap: () => _showRestaurantInfo(context, restaurant),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Colors.black.withValues(alpha: 0.3),
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            restaurant.name,
                            style: const TextStyle(
                              fontSize: 11, 
                              fontWeight: FontWeight.bold,
                              color: AppConstants.darkText
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.location_on_rounded, 
                          color: AppConstants.primaryOrange, 
                          size: 36,
                          shadows: [Shadow(color: Colors.black26, blurRadius: 10)],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }

  void _showRestaurantInfo(BuildContext context, RestaurantModel restaurant) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: restaurant.imageUrl.startsWith('assets/')
                      ? Image.asset(restaurant.imageUrl, width: 80, height: 80, fit: BoxFit.cover)
                      : Image.network(restaurant.imageUrl, width: 80, height: 80, fit: BoxFit.cover),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(restaurant.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(restaurant.category, style: const TextStyle(color: Colors.grey)),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          Text(' ${restaurant.rating.toStringAsFixed(1)}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/food-list', arguments: restaurant);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('VIEW MENU'),
            ),
          ],
        ),
      ),
    );
  }
}
