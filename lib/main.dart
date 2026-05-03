import 'package:flutter/material.dart';
import 'config/app_theme.dart';
import 'screens/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPorto - Ahmad Sahrul Fadhilah',
      theme: AppTheme.darkTheme(),
      debugShowCheckedModeBanner: false,
      home: const DashboardPage(),
    );
  }
}
