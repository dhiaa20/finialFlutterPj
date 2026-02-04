import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:exam_flutter/core/constants/app_constants.dart';
import 'package:exam_flutter/core/widgets/custom_button.dart';

/// Welcome screen - first screen shown when app opens
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isShortScreen = size.height < 700;
    final isWideScreen = size.width > 600;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppConstants.primaryOrange,
              const Color.fromARGB(181, 255, 5, 5),
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 900) {
                // Desktop / Side-by-Side Layout
                return Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(AppConstants.spacing48),
                        child: FadeInLeft(
                          duration: const Duration(milliseconds: 1200),
                          child: Center(
                            child: Image.asset(
                              'assets/images/food_delivery.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(AppConstants.spacing48),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _buildWelcomeContent(context, size, isShortScreen, true),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                // Mobile / Vertical Layout
                return Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppConstants.spacing24,
                          vertical: isShortScreen ? 20 : AppConstants.spacing40,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildWelcomeContent(context, size, isShortScreen, false),
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildWelcomeContent(BuildContext context, Size size, bool isShortScreen, bool isDesktop) {
    return [
      if (!isDesktop) // Image only on top for mobile
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: Container(
            height: size.height * (isShortScreen ? 0.25 : 0.35),
            constraints: const BoxConstraints(maxHeight: 300),
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: AppConstants.spacing40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
              child: Image.asset(
                'assets/images/food_delivery.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      
      FadeInUp(
        delay: const Duration(milliseconds: 400),
        duration: const Duration(milliseconds: 1000),
        child: Text(
          'Food Delivery',
          style: TextStyle(
            fontSize: isDesktop ? 56 : (size.width < 350 ? 32 : 42),
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
        ),
      ),
      
      const SizedBox(height: AppConstants.spacing12),
      
      FadeInUp(
        delay: const Duration(milliseconds: 600),
        duration: const Duration(milliseconds: 1000),
        child: Text(
          'Delicious meals delivered\nright to your door',
          style: TextStyle(
            fontSize: isDesktop ? 20 : 16,
            color: Colors.white.withValues(alpha: 0.95),
            height: 1.5,
            fontWeight: FontWeight.w400,
          ),
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
        ),
      ),
      
      const SizedBox(height: AppConstants.spacing40),
      
      _buildFeature(Icons.delivery_dining, 'Fast & Reliable Delivery', isDesktop),
      const SizedBox(height: AppConstants.spacing16),
      _buildFeature(Icons.restaurant_menu, 'Wide Variety of Cuisines', isDesktop),
      const SizedBox(height: AppConstants.spacing16),
      _buildFeature(Icons.verified, 'Top Quality Guaranteed', isDesktop),
      
      const SizedBox(height: AppConstants.spacing48),
      
      BounceInUp(
        delay: const Duration(milliseconds: 1400),
        duration: const Duration(milliseconds: 1000),
        child: CustomButton(
          text: 'Get Started',
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/signin');
          },
          icon: Icons.arrow_forward,
          width: isDesktop ? 300 : double.infinity,
        ),
      ),
      
      const SizedBox(height: AppConstants.spacing16),
      
      FadeIn(
        delay: const Duration(milliseconds: 1600),
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/signup');
          },
          child: Text(
            'or create a new account',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ];
  }

  Widget _buildFeature(IconData icon, String text, bool isDesktop) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 800),
      child: Row(
        mainAxisAlignment: isDesktop ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(AppConstants.spacing12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 22,
            ),
          ),
          const SizedBox(width: AppConstants.spacing16),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
