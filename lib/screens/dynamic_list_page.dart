import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../config/app_theme.dart';

class DynamicListPage extends StatefulWidget {
  const DynamicListPage({Key? key}) : super(key: key);

  @override
  State<DynamicListPage> createState() => _DynamicListPageState();
}

class _DynamicListPageState extends State<DynamicListPage> {
  final List<Map<String, dynamic>> _items = [
    {
      'id': 1,
      'title': 'Flutter Basics',
      'description': 'Learn the fundamentals of Flutter development',
      'icon': Icons.flutter_dash,
      'color': AppColors.primary,
    },
    {
      'id': 2,
      'title': 'Widget Mastery',
      'description': 'Master various Flutter widgets',
      'icon': Icons.widgets,
      'color': AppColors.accent,
    },
    {
      'id': 3,
      'title': 'State Management',
      'description': 'Understand state management patterns',
      'icon': Icons.settings_backup_restore,
      'color': AppColors.accentBright,
    },
    {
      'id': 4,
      'title': 'Firebase Integration',
      'description': 'Integrate Firebase with your app',
      'icon': Icons.cloud,
      'color': AppColors.warning,
    },
    {
      'id': 5,
      'title': 'API Integration',
      'description': 'Connect to REST APIs',
      'icon': Icons.api,
      'color': AppColors.info,
    },
    {
      'id': 6,
      'title': 'UI/UX Design',
      'description': 'Create beautiful and intuitive interfaces',
      'icon': Icons.palette,
      'color': AppColors.success,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      appBar: AppBar(
        title: const Text('Dynamic Lists'),
        backgroundColor: AppColors.cardBg,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(AppTheme.paddingMedium),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: AppTheme.paddingMedium),
            child: Card(
              color: AppColors.cardBg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppTheme.borderRadiusMedium,
                ),
              ),
              elevation: 4,
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Tapped: ${item['title']}'),
                      backgroundColor: item['color'],
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppTheme.borderRadiusMedium,
                        ),
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(
                  AppTheme.borderRadiusMedium,
                ),
                splashColor: item['color'].withOpacity(0.2),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppTheme.borderRadiusMedium,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.cardBg,
                        AppColors.cardBgHover.withOpacity(0.3),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(AppTheme.paddingMedium),
                  child: Row(
                    children: [
                      // Icon Container
                      Container(
                        padding: const EdgeInsets.all(AppTheme.paddingMedium),
                        decoration: BoxDecoration(
                          color: item['color'].withOpacity(0.15),
                          borderRadius: BorderRadius.circular(
                            AppTheme.borderRadiusMedium,
                          ),
                        ),
                        child: Icon(
                          item['icon'],
                          color: item['color'],
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: AppTheme.paddingMedium),

                      // Text Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(color: AppColors.textPrimary),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: AppTheme.paddingTiny),
                            Text(
                              item['description'],
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: AppColors.textSecondary),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppTheme.paddingSmall),

                      // Arrow Icon
                      Icon(
                        Icons.arrow_forward_ios,
                        color: item['color'],
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
