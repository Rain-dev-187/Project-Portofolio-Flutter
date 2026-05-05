import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../config/app_theme.dart';

class DynamicListPage extends StatefulWidget {
  const DynamicListPage({super.key});

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

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final List<IconData> _availableIcons = [
    Icons.flutter_dash,
    Icons.widgets,
    Icons.settings_backup_restore,
    Icons.cloud,
    Icons.api,
    Icons.palette,
    Icons.star,
    Icons.favorite,
    Icons.bookmark,
    Icons.notifications,
  ];

  final List<Color> _availableColors = [
    AppColors.primary,
    AppColors.accent,
    AppColors.accentBright,
    AppColors.warning,
    AppColors.info,
    AppColors.success,
  ];

  int _selectedIconIndex = 0;
  int _selectedColorIndex = 0;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _addItem() {
    _titleController.clear();
    _descriptionController.clear();
    _selectedIconIndex = 0;
    _selectedColorIndex = 0;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: AppColors.cardBg,
          title: Text(
            'Add New Item',
            style: TextStyle(color: AppColors.textPrimary),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleController,
                  style: TextStyle(color: AppColors.textPrimary),
                  decoration: InputDecoration(
                    hintText: 'Enter title',
                    hintStyle: TextStyle(color: AppColors.textSecondary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppTheme.borderRadiusMedium,
                      ),
                    ),
                    filled: true,
                    fillColor: AppColors.darkBg,
                  ),
                ),
                const SizedBox(height: AppTheme.paddingMedium),
                TextField(
                  controller: _descriptionController,
                  style: TextStyle(color: AppColors.textPrimary),
                  decoration: InputDecoration(
                    hintText: 'Enter description',
                    hintStyle: TextStyle(color: AppColors.textSecondary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppTheme.borderRadiusMedium,
                      ),
                    ),
                    filled: true,
                    fillColor: AppColors.darkBg,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: AppTheme.paddingMedium),
                Text(
                  'Select Icon:',
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                const SizedBox(height: AppTheme.paddingSmall),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _availableIcons.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.paddingTiny,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIconIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedIconIndex == index
                                ? AppColors.primary.withOpacity(0.3)
                                : AppColors.darkBg,
                            border: Border.all(
                              color: _selectedIconIndex == index
                                  ? AppColors.primary
                                  : AppColors.textSecondary.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(
                              AppTheme.borderRadiusMedium,
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            _availableIcons[index],
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppTheme.paddingMedium),
                Text(
                  'Select Color:',
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                const SizedBox(height: AppTheme.paddingSmall),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _availableColors.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.paddingTiny,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedColorIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _availableColors[index],
                            border: Border.all(
                              color: _selectedColorIndex == index
                                  ? AppColors.textPrimary
                                  : Colors.transparent,
                              width: _selectedColorIndex == index ? 3 : 0,
                            ),
                            borderRadius: BorderRadius.circular(
                              AppTheme.borderRadiusMedium,
                            ),
                          ),
                          width: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty &&
                    _descriptionController.text.isNotEmpty) {
                  setState(() {
                    _items.add({
                      'id': _items.isEmpty ? 1 : _items.last['id'] + 1,
                      'title': _titleController.text,
                      'description': _descriptionController.text,
                      'icon': _availableIcons[_selectedIconIndex],
                      'color': _availableColors[_selectedColorIndex],
                    });
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Item added successfully!'),
                      backgroundColor: AppColors.success,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppTheme.borderRadiusMedium,
                        ),
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteItem(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardBg,
        title: Text(
          'Delete Item?',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: Text(
          'Are you sure you want to delete "${_items[index]['title']}"?',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _items.removeAt(index);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Item deleted!'),
                  backgroundColor: AppColors.warning,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppTheme.borderRadiusMedium,
                    ),
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.warning),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      appBar: AppBar(
        title: const Text('Dynamic Lists'),
        backgroundColor: AppColors.cardBg,
      ),
      body: _items.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.list,
                    size: 64,
                    color: AppColors.textSecondary.withOpacity(0.5),
                  ),
                  const SizedBox(height: AppTheme.paddingMedium),
                  Text(
                    'No items yet',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: AppTheme.paddingSmall),
                  Text(
                    'Tap the + button to add your first item',
                    style: TextStyle(
                      color: AppColors.textSecondary.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(AppTheme.paddingMedium),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppTheme.paddingMedium,
                  ),
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
                              padding: const EdgeInsets.all(
                                AppTheme.paddingMedium,
                              ),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: AppColors.textPrimary,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: AppTheme.paddingTiny),
                                  Text(
                                    item['description'],
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                          color: AppColors.textSecondary,
                                        ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: AppTheme.paddingSmall),

                            // Delete Button
                            GestureDetector(
                              onTap: () => _deleteItem(index),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppColors.warning.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(
                                    AppTheme.borderRadiusMedium,
                                  ),
                                ),
                                child: Icon(
                                  Icons.delete_outline,
                                  color: AppColors.warning,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
