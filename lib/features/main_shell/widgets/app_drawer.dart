import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exam_flutter/core/constants/app_constants.dart';
import 'package:exam_flutter/features/authentication/providers/auth_provider.dart';
import 'package:exam_flutter/core/theme/theme_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().currentUser;
    final themeProvider = context.watch<ThemeProvider>();

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppConstants.primaryOrange, AppConstants.accentAmber],
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: user?.profileImage != null 
                ? NetworkImage(user!.profileImage!) 
                : null,
              child: user?.profileImage == null 
                ? Text(
                    user?.name[0].toUpperCase() ?? 'U',
                    style: const TextStyle(fontSize: 32, color: AppConstants.primaryOrange, fontWeight: FontWeight.bold),
                  )
                : null,
            ),
            accountName: Text(user?.name ?? 'User'),
            accountEmail: Text(user?.email ?? ''),
          ),
          ListTile(
            leading: const Icon(Icons.rate_review_outlined),
            title: const Text('My Reviews'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/my-reviews');
            },
          ),
          SwitchListTile(
            secondary: Icon(
              themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: themeProvider.isDarkMode ? Colors.amber : Colors.grey,
            ),
            title: const Text('Dark Mode'),
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.favorite_outline),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/favorites');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: AppConstants.errorRed),
            title: const Text('Logout', style: TextStyle(color: AppConstants.errorRed)),
            onTap: () {
              context.read<AuthProvider>().signOut();
              Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
