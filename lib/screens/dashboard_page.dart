import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../config/app_theme.dart';
import '../widgets/menu_card.dart';
import 'counter_page.dart';
import 'widget_bertingkat_page.dart';
import 'user_input_page.dart';
import 'dynamic_list_page.dart';
import 'navigasi_page.dart';
import 'grid_view_page.dart';
import 'about_me_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      appBar: AppBar(
        title: const Text('MyPorto'),
        elevation: 0,
        backgroundColor: AppColors.cardBg,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section with improved text
              Container(
                padding: const EdgeInsets.all(AppTheme.paddingMedium),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary.withOpacity(0.1),
                      AppColors.accent.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.rocket_launch_outlined,
                          color: AppColors.primary,
                          size: 28,
                        ),
                        const SizedBox(width: AppTheme.paddingSmall),
                        Text(
                          'Selamat Datang Di My Porto!',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.paddingSmall),
                    Text(
                      'Check Hasil Karya Ku Disini',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppTheme.paddingLarge),

              // Menu Grid
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: AppTheme.paddingMedium,
                mainAxisSpacing: AppTheme.paddingMedium,
                childAspectRatio: 0.95,
                children: [
                  MenuCard(
                    icon: Icons.add_circle_outline,
                    title: 'Counter App',
                    subtitle: 'State Management',
                    iconColor: AppColors.primary,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CounterPage(),
                        ),
                      );
                    },
                  ),
                  MenuCard(
                    icon: Icons.layers_outlined,
                    title: 'Widget Bertingkat',
                    subtitle: 'Hierarchi Layout',
                    iconColor: AppColors.accentBright,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WidgetBertingkatPage(),
                        ),
                      );
                    },
                  ),
                  MenuCard(
                    icon: Icons.edit_outlined,
                    title: 'Form Input',
                    subtitle: 'User Interaction',
                    iconColor: AppColors.primaryLight,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserInputPage(),
                        ),
                      );
                    },
                  ),
                  MenuCard(
                    icon: Icons.list_outlined,
                    title: 'Dynamic Lists',
                    subtitle: 'Data Display',
                    iconColor: AppColors.accent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DynamicListPage(),
                        ),
                      );
                    },
                  ),
                  MenuCard(
                    icon: Icons.navigation_outlined,
                    title: 'Navigation',
                    subtitle: 'Page Routing',
                    iconColor: AppColors.success,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavigasiPage(),
                        ),
                      );
                    },
                  ),
                  MenuCard(
                    icon: Icons.grid_view_outlined,
                    title: 'Grid Layout',
                    subtitle: 'Responsive Design',
                    iconColor: AppColors.info,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GridViewPage(),
                        ),
                      );
                    },
                  ),
                  MenuCard(
                    icon: Icons.person_outline,
                    title: 'About Me',
                    subtitle: 'Portfolio Profile',
                    iconColor: AppColors.warning,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutMePage(),
                        ),
                      );
                    },
                  ),
                  // Additional placeholder for balanced grid
                  MenuCard(
                    icon: Icons.favorite_outline,
                    title: 'Coming Soon',
                    iconColor: AppColors.error,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Coming Soon...'),
                          backgroundColor: AppColors.info,
                          behavior: SnackBarBehavior.floating,
                          margin: const EdgeInsets.all(AppTheme.paddingMedium),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppTheme.borderRadiusMedium,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
