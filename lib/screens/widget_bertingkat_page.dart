import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../config/app_theme.dart';

class WidgetBertingkatPage extends StatelessWidget {
  const WidgetBertingkatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      appBar: AppBar(
        title: const Text('Nested Widgets'),
        backgroundColor: AppColors.cardBg,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Level 1
              Text(
                'Level 1 - Outer Container',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: AppTheme.paddingSmall),
              Card(
                color: AppColors.cardBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                ),
                elevation: 8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppTheme.borderRadiusMedium,
                    ),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(AppTheme.paddingMedium),
                  child: Column(
                    children: [
                      // Level 2
                      Text(
                        'Level 2 - Middle Container',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: AppColors.accentBright),
                      ),
                      const SizedBox(height: AppTheme.paddingSmall),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            AppTheme.borderRadiusMedium,
                          ),
                          color: AppColors.cardBgHover,
                          border: Border.all(
                            color: AppColors.accentBright.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(AppTheme.paddingMedium),
                        child: Column(
                          children: [
                            // Level 3
                            Text(
                              'Level 3 - Inner Container',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(color: AppColors.accent),
                            ),
                            const SizedBox(height: AppTheme.paddingSmall),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppTheme.borderRadiusMedium,
                                ),
                                color: AppColors.darkBg,
                                border: Border.all(
                                  color: AppColors.accent.withOpacity(0.5),
                                  width: 2,
                                ),
                              ),
                              padding: const EdgeInsets.all(
                                AppTheme.paddingMedium,
                              ),
                              child: Column(
                                children: [
                                  // Level 4 - Deepest
                                  Icon(
                                    Icons.check_circle,
                                    color: AppColors.accent,
                                    size: 48,
                                  ),
                                  const SizedBox(height: AppTheme.paddingSmall),
                                  Text(
                                    'Level 4 - Deepest Widget',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.paddingLarge),

              // Example 2: Row/Column Nesting
              Text(
                'Example - Row & Column Nesting',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: AppTheme.paddingSmall),
              Card(
                color: AppColors.cardBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.paddingMedium),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(
                                  AppTheme.borderRadiusMedium,
                                ),
                              ),
                              padding: const EdgeInsets.all(
                                AppTheme.paddingMedium,
                              ),
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: AppColors.primary,
                                    size: 32,
                                  ),
                                  const SizedBox(height: AppTheme.paddingSmall),
                                  Text(
                                    'Column 1',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: AppTheme.paddingMedium),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.accent.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(
                                  AppTheme.borderRadiusMedium,
                                ),
                              ),
                              padding: const EdgeInsets.all(
                                AppTheme.paddingMedium,
                              ),
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.favorite,
                                    color: AppColors.accent,
                                    size: 32,
                                  ),
                                  const SizedBox(height: AppTheme.paddingSmall),
                                  Text(
                                    'Column 2',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppTheme.paddingMedium),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.accentBright.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(
                                  AppTheme.borderRadiusMedium,
                                ),
                              ),
                              padding: const EdgeInsets.all(
                                AppTheme.paddingMedium,
                              ),
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.thumb_up,
                                    color: AppColors.accentBright,
                                    size: 32,
                                  ),
                                  const SizedBox(height: AppTheme.paddingSmall),
                                  Text(
                                    'Column 3',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: AppTheme.paddingMedium),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.success.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(
                                  AppTheme.borderRadiusMedium,
                                ),
                              ),
                              padding: const EdgeInsets.all(
                                AppTheme.paddingMedium,
                              ),
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.check,
                                    color: AppColors.success,
                                    size: 32,
                                  ),
                                  const SizedBox(height: AppTheme.paddingSmall),
                                  Text(
                                    'Column 4',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
