import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../config/app_theme.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      'Flutter',
      'Dart',
      'Material Design',
      'State Management',
      'API Integration',
      'Database',
      'Authentication',
      'Push Notifications',
      'Offline Support',
      'Testing',
      'CI/CD',
      'Deployment',
    ];

    final colors = [
      AppColors.primary,
      AppColors.accent,
      AppColors.accentBright,
      AppColors.success,
      AppColors.warning,
      AppColors.info,
      AppColors.error,
      AppColors.primaryLight,
      AppColors.accentLight,
      AppColors.primaryDark,
      AppColors.primary,
      AppColors.accent,
    ];

    return Scaffold(
      backgroundColor: AppColors.darkBg,
      appBar: AppBar(
        title: const Text('Grid Layout'),
        backgroundColor: AppColors.cardBg,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Teknologi & Framework',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: AppTheme.paddingSmall),
              Text(
                'Kumpulan teknologi yang saya kuasai dalam pengembangan aplikasi',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppTheme.paddingMedium),

              // Main Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: AppTheme.paddingMedium,
                  mainAxisSpacing: AppTheme.paddingMedium,
                  childAspectRatio: 1,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return _buildGridItem(
                    context,
                    items[index],
                    colors[index],
                    _getTechIconForIndex(index),
                  );
                },
              ),
              const SizedBox(height: AppTheme.paddingMedium),

              Text(
                'Fitur Aplikasi',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: AppTheme.paddingSmall),

              // 2-Column Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppTheme.paddingMedium,
                  mainAxisSpacing: AppTheme.paddingMedium,
                  childAspectRatio: 1.2,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return _buildGridItem(
                    context,
                    _getFeatureName(index),
                    colors[index % colors.length],
                    _getIconForIndex(index),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(
    BuildContext context,
    String title,
    Color color,
    IconData icon,
  ) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Tapped: $title'),
            backgroundColor: color,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
      splashColor: color.withOpacity(0.3),
      child: Card(
        color: AppColors.cardBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        ),
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.cardBg,
                AppColors.cardBgHover.withOpacity(0.5),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(AppTheme.paddingMedium),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                ),
                child: Icon(icon, color: color, size: 32),
              ),
              const SizedBox(height: AppTheme.paddingSmall),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getTechIconForIndex(int index) {
    final icons = [
      Icons.flutter_dash, // Flutter
      Icons.code, // Dart
      Icons.design_services, // Material Design
      Icons.memory, // State Management
      Icons.api, // API Integration
      Icons.storage, // Database
      Icons.security, // Authentication
      Icons.notifications, // Push Notifications
      Icons.wifi_off, // Offline Support
      Icons.bug_report, // Testing
      Icons.build, // CI/CD
      Icons.cloud_upload, // Deployment
    ];
    return icons[index % icons.length];
  }

  String _getFeatureName(int index) {
    final features = [
      'User Interface',
      'Data Management',
      'Security',
      'Performance',
      'Analytics',
      'User Experience',
    ];
    return features[index % features.length];
  }

  IconData _getIconForIndex(int index) {
    final icons = [
      Icons.palette,
      Icons.data_usage,
      Icons.shield,
      Icons.speed,
      Icons.analytics,
      Icons.accessibility,
    ];
    return icons[index % icons.length];
  }
}
