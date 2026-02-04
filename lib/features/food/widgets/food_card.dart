import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exam_flutter/core/constants/app_constants.dart';
import 'package:exam_flutter/features/food/models/food_model.dart';
import 'package:exam_flutter/features/cart/providers/cart_provider.dart';
import 'package:exam_flutter/features/favorites/providers/favorites_provider.dart';

class FoodCard extends StatelessWidget {
  final FoodModel food;
  final bool isVertical;

  const FoodCard({super.key, required this.food, this.isVertical = false});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = context.watch<FavoritesProvider>();
    final isFavorite = favoritesProvider.isFoodFavorite(food.id.toString());

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/food-details',
          arguments: food,
        );
      },
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
          side: BorderSide(color: Colors.grey.withValues(alpha: 0.1), width: 1),
        ),
        clipBehavior: Clip.antiAlias,
        child: isVertical 
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImage(isFavorite, favoritesProvider),
                  _buildContent(context),
                ],
              )
            : Row(
                children: [
                  _buildImage(isFavorite, favoritesProvider),
                  Expanded(child: _buildContent(context)),
                ],
              ),
      ),
    );
  }

  Widget _buildImage(bool isFavorite, FavoritesProvider favoritesProvider) {
    return Stack(
      children: [
        Hero(
          tag: 'food_${food.id}',
          child: Image.network(
            food.thumbnail,
            height: isVertical ? 160 : 110,
            width: isVertical ? double.infinity : 110,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: isVertical ? 160 : 110,
              width: isVertical ? double.infinity : 110,
              color: Colors.grey[200],
              child: const Icon(Icons.fastfood, color: Colors.grey),
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: () => favoritesProvider.toggleFoodFavorite(food.id.toString()),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.8),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? AppConstants.errorRed : AppConstants.lightText,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppConstants.spacing12, AppConstants.spacing12, AppConstants.spacing12, AppConstants.spacing8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            food.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            food.category,
            style: const TextStyle(color: AppConstants.lightText, fontSize: 12),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${food.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: AppConstants.primaryOrange,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  letterSpacing: -0.5,
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    context.read<CartProvider>().addItem(food);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${food.title} added to cart!'),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.add_shopping_cart, color: AppConstants.primaryOrange, size: 24),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
